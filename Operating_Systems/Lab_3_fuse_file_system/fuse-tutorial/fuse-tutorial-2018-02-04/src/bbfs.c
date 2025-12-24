/*
  Big Brother File System
  Copyright (C) 2012 Joseph J. Pfeiffer, Jr., Ph.D. <pfeiffer@cs.nmsu.edu>

  This program can be distributed under the terms of the GNU GPLv3.
  See the file COPYING.

  This code is derived from function prototypes found /usr/include/fuse/fuse.h
  Copyright (C) 2001-2007  Miklos Szeredi <miklos@szeredi.hu>
  His code is licensed under the LGPLv2.
  A copy of that code is included in the file fuse.h
  
  The point of this FUSE filesystem is to provide an introduction to
  FUSE.  It was my first FUSE filesystem as I got to know the
  software; hopefully, the comments in this code will help people who
  follow later to get a gentler introduction.

  This might be called a no-op filesystem:  it doesn't impose
  filesystem semantics on top of any other existing structure.  It
  simply reports the requests that come in, and passes them to an
  underlying filesystem.  The information is saved in a logfile named
  bbfs.log, in the directory from which you run bbfs.
*/
#include "config.h"
#include "params.h"
#include <ctype.h>
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <fuse.h>
#include <libgen.h>
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdbool.h>
#include <openssl/sha.h>

#ifdef HAVE_SYS_XATTR_H
#include <sys/xattr.h>
#endif

#include "log.h"

static void bb_fullpath(char fpath[PATH_MAX], const char *path)
{
    strcpy(fpath, BB_DATA->rootdir);
    strncat(fpath, path, PATH_MAX); // ridiculously long paths will
				    // break here

    log_msg("    bb_fullpath:  rootdir = \"%s\", path = \"%s\", fpath = \"%s\"\n",
	    BB_DATA->rootdir, path, fpath);
}

/*******************************************************************************/

#define BLOCK_SIZE 4096
char STORAGE_DIR[256];
//#define META_DIR "./metadata/"

#define MAX_FILES     10
#define MAX_BLOCKS    16         // 64KB / 4KB = 16 blocks per file
#define HASH_LEN      41         // 40 chars + null terminator
#define MAX_FILENAME  256



typedef struct {
    char filename[MAX_FILENAME];       // e.g., "myfile.txt"
    char hashes[MAX_BLOCKS][HASH_LEN]; // hashes for each block
    long last_block_size;         // size of the last block (if not full)
    bool used;                         // true if entry is active
} file_metadata_t;

file_metadata_t metadata_table[MAX_FILES];




void *bbfs_init(struct fuse_conn_info *conn)
{
    //Initialize the metadata table
    for (int i = 0; i < MAX_FILES; i++) {
        metadata_table[i].used = false;
        memset(metadata_table[i].filename, 0, MAX_FILENAME);
        for (int j = 0; j < MAX_BLOCKS; j++) {
            //make Null for use distinguishing if a block has been written to
            metadata_table[i].hashes[j][0] = '\0';
        }
    }
    //Make storage folder
    if (mkdir(STORAGE_DIR, 0755) == -1 && errno != EEXIST) {
        log_msg("mkdir block_storage error: %s\n", strerror(errno));
    }

    log_msg("\nbbfs_init()\n");
    log_conn(conn);
    log_fuse_context(fuse_get_context());
    
    return BB_DATA;
}

//This function produces the hash of the blocks data, used for its name
static void hash_block(const char *block, char *hash_out) {
    unsigned char hash[SHA_DIGEST_LENGTH];
    SHA1((unsigned char*)block, BLOCK_SIZE, hash);

    for (int i = 0; i < SHA_DIGEST_LENGTH; i++) {
        sprintf(&hash_out[i*2], "%02x", hash[i]);
    }
    hash_out[40] = '\0';
}

//this function is called when we need to write a block of 4kb in our storage
//It also responsible for handlinging overwrite in specific blocks
static const size_t write_block(const char *block, size_t offset, const char *hash_overwrite, char *new_hash, bool overwrite, size_t write_to_block, size_t write_size) {
    char hash[41];
    char filepath_storage[PATH_MAX];
    char filepath_use[PATH_MAX];
    char temp_block[BLOCK_SIZE]; //Used for overwriting blocks
    char readBlock[BLOCK_SIZE]; //Used for reading blocks
    int num_of_users = 0; //Used to track how many files use a certain block
    size_t overwrite_offset = 0;
    memcpy(temp_block, block, BLOCK_SIZE);

    log_msg("overwrite: %d\n", overwrite);

    if(overwrite) {
        snprintf(filepath_storage, sizeof(filepath_storage), "%s%s", STORAGE_DIR, hash_overwrite);
        snprintf(filepath_use, sizeof(filepath_use), "%s%s_use", STORAGE_DIR, hash_overwrite);

        //Check if storage block exists
        if(access(filepath_storage, F_OK) != 0) {
            log_msg("Block should exist but doesnt\n");
            log_msg("%s\n", hash_overwrite);
            return -1;
        }

        //opens files
        FILE *file = fopen(filepath_storage, "rb");
        FILE *file_use = fopen(filepath_use, "r+b");
        if(!file || !file_use) {
            perror("write_block fopen");
            return -1;
        }

        //overwrite the block at the offset
        log_msg("block is %s and tempb4Read: %s\n",block, temp_block);
        size_t read = fread(temp_block, 1, BLOCK_SIZE, file);
 

        log_msg("tempb4: %s\n", temp_block);
        memcpy(temp_block + offset, block, write_to_block);
        log_msg("tempafter: %s\n", temp_block);
        //after the overwrite the block is going to be written fron offset 0
        overwrite_offset = offset;
        offset = 0;
        //Read how many use the old block
        if (fscanf(file_use, "%d", &num_of_users) != 1) {
            num_of_users = 0;
            log_msg("fscanf fail\n");
        }
        log_msg("num_of_users_over: %d\n", num_of_users);
        //decrease the number by one since we are creating a new block
        num_of_users--;

        //if no one needs the block delete it
        //Or write the new number
        if(num_of_users == 0) {
            remove(filepath_storage);
            remove(filepath_use);
        } else {
            fseek(file_use, 0, SEEK_SET);
            fprintf(file_use, "%d", num_of_users);
        }

        fclose(file);
        fclose(file_use);
    }
    //hash the new combined block
    hash_block(temp_block, hash);
    //Copy the new_hash to the output
    strncpy(new_hash, hash, HASH_LEN - 1);
    new_hash[HASH_LEN - 1] = '\0';

    //Erase previous paths
    filepath_storage[0] = '\0';
    filepath_use[0] = '\0';

    snprintf(filepath_storage, sizeof(filepath_storage), "%s%s", STORAGE_DIR, hash);
    snprintf(filepath_use, sizeof(filepath_use), "%s%s_use", STORAGE_DIR, hash);

    //If the storage block exists we have a hash collision no need to write extra block
    if(access(filepath_storage, F_OK) == 0) {
        log_msg("hash collision\n");

        FILE *file_use = fopen(filepath_use, "r+b");
        if (!file_use) {
            perror("write_block fopen");
            return -1;
        }

        //Increase number of files using this block
        if (fscanf(file_use, "%d", &num_of_users) != 1) {
            num_of_users = 0;
            log_msg("fscanf fail\n");
        }
        log_msg("num_of_users: %d\n", num_of_users);

        num_of_users++;

        fseek(file_use, 0, SEEK_SET);
        fprintf(file_use, "%d", num_of_users);

        fclose(file_use);
        return BLOCK_SIZE - offset;
    }

    FILE *file = fopen(filepath_storage, "wb");
    FILE *file_use = fopen(filepath_use, "wb");
    if (!file || !file_use) {
        perror("write_block fopen");
        return -1;
    }
    //Write the combined block
    // log_msg("Writing buf %s and overwrite offset %lld\n", temp_block, overwrite_offset);
    size_t write_to_storage = -1;
    if (write_size != -1 ) {
        write_to_storage = write_size;
    }else {
        write_to_storage = write_to_block + overwrite_offset; // Write the whole block minus the offset
    }
    size_t written = fwrite(temp_block + offset, 1, write_to_storage, file);
    log_msg("written %zu, expected %zu, offset is %zu\n", written, write_to_block, offset);
    if( written < write_to_block) {
        perror("write_block fwrite");
    }
    //As is new, only one file uses this block
    num_of_users = 1;
    
    fprintf(file_use, "%d", num_of_users);
    
    fclose(file);
    fclose(file_use);

    return written;
}

//This is the write function and is responsible for opening or creating its file,
//handle the metadata array and give the appropriate args to the write block function
static int bbfs_write(const char *path, const char *buf, size_t size, off_t offset,struct fuse_file_info *fi) {
    int block_num =  offset / BLOCK_SIZE;
    size_t block_offset = offset % BLOCK_SIZE;
    size_t total = 0;
    int i = 0;
    char fullpath[PATH_MAX];

    snprintf(fullpath, sizeof(fullpath), "%s", path + 1); // +1 to avoid the / at the start

    log_msg("\nbbfs_write(path=\"%s\", buf=0x%08x, size=%d, offset=%lld,block_offset is %lld ,block num is %d, fi=0x%08x)\n",path, buf, size, offset, block_offset,block_num, fi);
    log_fi(fi);
    log_msg("buf %s\n", buf);

    //find the file if it exists in the metadata table
    for(i = 0; i < MAX_FILES; i++) {
        if (metadata_table[i].used && strcmp(metadata_table[i].filename, fullpath) == 0) {
            log_msg("File found in metadata: %s\n", metadata_table[i].filename);
            fi->fh = i; // Store the index in the file handle
            break; // File found
        }
    }

    //if it does not exist, we need to create a new entry in the metadata table
    if(i == MAX_FILES) {
        for(int i = 0; i < MAX_FILES; i++) {
            if (!metadata_table[i].used) {
                // Found an empty 
                metadata_table[i].used = true;
                strncpy(metadata_table[i].filename, fullpath, MAX_FILENAME - 1);
                metadata_table[i].filename[MAX_FILENAME - 1] = '\0';
                fi->fh = i; //keep the index
                log_msg("position given %d\n", i);
                break;
            }
        }
    }

    //This part slplits the buffer into 4kb sections and feeds them to the write_block function
    while(total < size) {
        size_t write_to_block = (size - total < BLOCK_SIZE - block_offset) ? size - total : BLOCK_SIZE - block_offset;
        char block[BLOCK_SIZE];
        char temp_block[BLOCK_SIZE]; //Used for overwriting blocks
        memset(block, 0, BLOCK_SIZE);
        memset(temp_block, 0, BLOCK_SIZE); 

        memcpy(block + block_offset, buf + total, write_to_block);
        memcpy(temp_block, buf + total, write_to_block);
        // log_msg("block is %s and temp_block is %s\n", block, temp_block);
        log_msg("iter %d\n", total);

        char hash[41];
        char metadata[64];
        char hash_overwrite[41] = {0};
        char new_hash[41];

        //Find the hash of the block
        hash_block(block, hash);

        int write_status;

        //Checks if the currect block in the current file has already been written to
        //if so it checks if the block we are writting is the same as the one already written
        //if so nothing needs to be done, else it needs to overwrite the block
        if (metadata_table[fi->fh].hashes[block_num][0] != '\0') {
            strcpy(hash_overwrite, metadata_table[fi->fh].hashes[block_num]);
             //Might need overwrite since we have already written to this 4KB part off the file
            log_msg("hash_overwrite is %s\n stored hash is %s\n and calc hash is %s\n", hash_overwrite, metadata_table[fi->fh].hashes[block_num], hash);
            if(strcmp(metadata_table[fi->fh].hashes[block_num], hash) != 0) {
                //this means block exists with different contents
                if ( (block_num != MAX_BLOCKS -1) && metadata_table[fi->fh].hashes[block_num+1][0] == '\0') { 
                    if ( block_offset + write_to_block > metadata_table[fi->fh].last_block_size) {
                        write_status = write_block(temp_block, block_offset, hash_overwrite, new_hash, true, write_to_block, -1);
                        log_msg("write new SIZE status is %d and write to block is %d, block offset is %lld\n", write_status, write_to_block, block_offset);
                        strcpy(metadata_table[fi->fh].hashes[block_num], new_hash);
                        metadata_table[fi->fh].used = true;
                        metadata_table[fi->fh].last_block_size = write_status; // Store the size of the last block if not full
                    } else {
                        write_status = write_block(temp_block, block_offset, hash_overwrite, new_hash, true, write_to_block, metadata_table[fi->fh].last_block_size);
                        log_msg("write status is %d and write to block is %d, block offset is %lld\n", write_status, write_to_block, block_offset);
                        strcpy(metadata_table[fi->fh].hashes[block_num], new_hash);
                        metadata_table[fi->fh].used = true;
                    }
                }
            }else {
                log_msg("No need to write_block\n");
            }
        }else {
            //New block for this file 
            write_status = write_block(block, block_offset, hash_overwrite, new_hash, false, write_to_block, -1);
            log_msg("write status is %d and write to block is %d\n", write_status, write_to_block);
            strcpy(metadata_table[fi->fh].hashes[block_num], hash);
            metadata_table[fi->fh].used = true;
            log_msg("New block written with hash: %s\n", hash);
                metadata_table[fi->fh].last_block_size = write_status; // Store the size of the last block if not full
        }
        if(write_status != write_to_block) log_msg("Error write_status != write_to_block\n");
          
        total += write_to_block;
        block_offset = 0;
        block_num++;
    }

    return total; // Return the total number of bytes written
}

static int bbfs_getattr(const char *path, struct stat *stbuf) {
    char name[PATH_MAX];
    char fullpath[PATH_MAX]; 
    snprintf(name, sizeof(name), "%s", path + 1); // +1 to avoid the / at the start

    log_msg("\nbbfs_getattr(path=\"%s\", statbuf=0x%08x)\n",path, stbuf);
    bb_fullpath(fullpath, path);

    memset(stbuf, 0, sizeof(struct stat));
    
    //snprintf(fullpath, sizeof(fullpath), "%s", STORAGE_DIR"../rootdir/"name); // Assuming rootdir is the mount point

    int retstat = log_syscall("lstat", lstat(fullpath, stbuf), 0);

    if (retstat != -errno) {
        for(int i = 0; i < MAX_FILES; i++) {
            if (metadata_table[i].used && strcmp(metadata_table[i].filename, name) == 0) {
                for(int j = 0; j < MAX_BLOCKS; j++) {
                    if (j != MAX_BLOCKS -1  && metadata_table[i].hashes[j + 1][0] == '\0') {
                        stbuf->st_size += metadata_table[i].last_block_size; // Add size of the last block if not full
                        break; // Stop adding sizes after the last block
                    } else if (metadata_table[i].hashes[j][0] != '\0') {
                        stbuf->st_size += BLOCK_SIZE; // Assuming each block is 4KB
                    }
                }
                log_msg("File found in metadata: %s size: %d\n", metadata_table[i].filename, stbuf->st_size);
                break;
            }
        }
    }
    log_stat(stbuf);

    return retstat; // File not found
}

static int bbfs_unlink(const char *path) {
    char fpath[PATH_MAX];
    char fullpath[PATH_MAX];
    int i, position_of_file;
    snprintf(fullpath, sizeof(fullpath), "%s", path + 1); // +1 to avoid the / at the start

    log_msg("\nbbfs_inlink(path=\"%s\n",path);

    //find the file if it exists in the metadata table
    for(i = 0; i < MAX_FILES; i++) {
        if (metadata_table[i].used && strcmp(metadata_table[i].filename, fullpath) == 0) {
            log_msg("File found in metadata: %s\n", metadata_table[i].filename);
            position_of_file = i; // Store the index in the file handle
            break; // File found
        }
    }

    for(i = 0; i < MAX_BLOCKS; i++) {
        if (metadata_table[position_of_file].hashes[i][0] != '\0') {
            char filepath_storage[PATH_MAX];
            char filepath_use[PATH_MAX];
            snprintf(filepath_storage, sizeof(filepath_storage), "%s%s", STORAGE_DIR, metadata_table[position_of_file].hashes[i]);
            snprintf(filepath_use, sizeof(filepath_use), "%s%s_use", STORAGE_DIR, metadata_table[position_of_file].hashes[i]);

            if(access(filepath_storage, F_OK) != 0) {
                log_msg("Block should exist but doesnt\n");
                log_msg("%s\n", metadata_table[position_of_file].hashes[i]);
                return -1;
            }

            //opens files
            FILE *file_use = fopen(filepath_use, "r+b");
            if(!file_use) {
                perror("unlink fopen");
                return -1;
            }

            int num_of_users = 0;

            //Read how many use the old block
            if (fscanf(file_use, "%d", &num_of_users) != 1) {
                num_of_users = 0;
                log_msg("fscanf fail\n");
            }
            log_msg("num_of_users_over: %d\n", num_of_users);

            //decrease the number by one since we are creating a new block
            num_of_users--;

            //if no one needs the block delete it
            //Or write the new number
            if(num_of_users == 0) {
                remove(filepath_storage);
                remove(filepath_use);
            } else {
                fseek(file_use, 0, SEEK_SET);
                fprintf(file_use, "%d", num_of_users);
            }

            metadata_table[position_of_file].hashes[i][0] = '\0';

            fclose(file_use);
        }
        metadata_table[position_of_file].used = false; // Mark the file as unused
    }

    log_msg("bb_unlink(path=\"%s\")\n",
	    path);
    bb_fullpath(fpath, path);

    return log_syscall("unlink", unlink(fpath), 0);
}

static const int read_block(char *block, int offset, const char *read_hash,size_t read_from_block) {
    char filepath_storage[PATH_MAX];

    snprintf(filepath_storage, sizeof(filepath_storage), "%s%s", STORAGE_DIR, read_hash);

    //Check if storage block exists
    if(access(filepath_storage, F_OK) != 0) {
        log_msg("Block should exist but doesnt\n");
        log_msg("%s\n", read_hash);
        return -1;
    }

    FILE *file = fopen(filepath_storage, "rb");
    if(!file ) {
        perror("read_block fopen");
        return -errno;
    }

    //Read the block at the offset
    fseek(file, offset, SEEK_SET);
    size_t read = fread(block + offset, 1, read_from_block, file);

    fclose(file);
    return read;
}
int bbfs_read(const char *path, char *buf, size_t size, off_t offset, struct fuse_file_info *fi) {
    int block_num =  offset / BLOCK_SIZE;
    int block_offset = offset % BLOCK_SIZE;
    size_t total = 0;
    char fullpath[PATH_MAX];

    snprintf(fullpath, sizeof(fullpath), "%s", path + 1); // +1 to avoid the / at the start

    log_msg("\nbbfs_read(path=\"%s\", size=%d, offset=%lld, fi=0x%08x)\n",
	    path, size, offset, fi);

    //find the file if it exists in the metadata table
    for(int i = 0; i < MAX_FILES; i++) {
        if (metadata_table[i].used && strcmp(metadata_table[i].filename, fullpath) == 0) {
            log_msg("File found in metadata: %s\n", metadata_table[i].filename);
            fi->fh = i; 
            break; 
        }
    }

    while(total < size) {
        size_t read_from_block = (size - total < BLOCK_SIZE - block_offset) ? size - total : BLOCK_SIZE - block_offset;
        char block[BLOCK_SIZE];

        memset(block, 0, BLOCK_SIZE); 

        log_msg("iter %d\n", total);

        read_block(block, block_offset, metadata_table[fi->fh].hashes[block_num], read_from_block);
        log_msg("read %s\n", block);
        memcpy(buf + total, block, read_from_block);
        log_msg("read %s\n", buf);
        total += read_from_block;
        block_offset = 0;
        block_num++;
    }
    log_msg("read %s\n", buf);
    return total; 
}

void delete_contents(const char *folder) {
    DIR *dir = opendir(folder);
    struct dirent *entry;
    char path[PATH_MAX];

    while ((entry = readdir(dir)) != NULL) {
        if (!strcmp(entry->d_name, ".") || !strcmp(entry->d_name, ".."))
            continue;
        snprintf(path, sizeof(path), "%s/%s", folder, entry->d_name);
        struct stat st;
        if (stat(path, &st) == 0) {
            if (S_ISDIR(st.st_mode)) {
                delete_contents(path);
                rmdir(path);
            } else {
                unlink(path);
            }
        }
    }
    closedir(dir);
}

void bbfs_destroy(void *userdata)
{
    log_msg("\nbb_destroy(userdata=0x%08x)\n", userdata);

    char cmd[PATH_MAX + 20];
    snprintf(cmd, sizeof(cmd), "rm -rf '%s'", STORAGE_DIR);
    int j = system(cmd);
    if (j != 0) {
        log_msg("Failed to remove %s\n", STORAGE_DIR);
    }

    delete_contents(BB_DATA->rootdir);
}


/*##################################################
    PROSTHESAME STHN MKNODE PERMISIONS ETSI WSTE
    O OWNER NA MPOREI NA DIAVAZEI KAI NA GRAFEI
##################################################*/

/** Create a file node
 *
 * There is no create() operation, mknod() will be called for
 * creation of all non-directory, non-symlink nodes.
 */
// shouldn't that comment be "if" there is no.... ?
int bb_mknod(const char *path, mode_t mode, dev_t dev)
{
    int retstat;
    char fpath[PATH_MAX];
    
    log_msg("\nbb_mknod(path=\"%s\", mode=0%3o, dev=%lld)\n",
	  path, mode, dev);
    bb_fullpath(fpath, path);
    
    // On Linux this could just be 'mknod(path, mode, dev)' but this
    // tries to be be more portable by honoring the quote in the Linux
    // mknod man page stating the only portable use of mknod() is to
    // make a fifo, but saying it should never actually be used for
    // that.
    
    /* guarantee owner can at least read & write */
    mode |= S_IRUSR | S_IWUSR; // PROSTHIKI MAS

    if (S_ISREG(mode)) {
	retstat = log_syscall("open", open(fpath, O_CREAT | O_EXCL | O_WRONLY, mode), 0);
	if (retstat >= 0)
	    retstat = log_syscall("close", close(retstat), 0);
    } else
	if (S_ISFIFO(mode))
	    retstat = log_syscall("mkfifo", mkfifo(fpath, mode), 0);
	else
	    retstat = log_syscall("mknod", mknod(fpath, mode, dev), 0);
    
    return retstat;
}

/***************************************************************************************/

///////////////////////////////////////////////////////////
//
// Prototypes for all these functions, and the C-style comments,
// come from /usr/include/fuse.h
//
/** Get file attributes.
 *
 * Similar to stat().  The 'st_dev' and 'st_blksize' fields are
 * ignored.  The 'st_ino' field is ignored except if the 'use_ino'
 * mount option is given.
 */
int bb_getattr(const char *path, struct stat *statbuf)
{
    int retstat;
    char fpath[PATH_MAX];
    
    log_msg("\nbb_getattr(path=\"%s\", statbuf=0x%08x)\n",
	  path, statbuf);
    bb_fullpath(fpath, path);

    retstat = log_syscall("lstat", lstat(fpath, statbuf), 0);
    
    log_stat(statbuf);
    
    return retstat;
}

/** Read the target of a symbolic link
 *
 * The buffer should be filled with a null terminated string.  The
 * buffer size argument includes the space for the terminating
 * null character.  If the linkname is too long to fit in the
 * buffer, it should be truncated.  The return value should be 0
 * for success.
 */
// Note the system readlink() will truncate and lose the terminating
// null.  So, the size passed to to the system readlink() must be one
// less than the size passed to bb_readlink()
// bb_readlink() code by Bernardo F Costa (thanks!)
int bb_readlink(const char *path, char *link, size_t size)
{
    int retstat;
    char fpath[PATH_MAX];
    
    log_msg("\nbb_readlink(path=\"%s\", link=\"%s\", size=%d)\n",
	  path, link, size);
    bb_fullpath(fpath, path);

    retstat = log_syscall("readlink", readlink(fpath, link, size - 1), 0);
    if (retstat >= 0) {
	link[retstat] = '\0';
	retstat = 0;
	log_msg("    link=\"%s\"\n", link);
    }
    
    return retstat;
}



/** Create a directory */
int bb_mkdir(const char *path, mode_t mode)
{
    char fpath[PATH_MAX];
    
    log_msg("\nbb_mkdir(path=\"%s\", mode=0%3o)\n",
	    path, mode);
    bb_fullpath(fpath, path);

    return log_syscall("mkdir", mkdir(fpath, mode), 0);
}

/** Remove a file */
int bb_unlink(const char *path)
{
    char fpath[PATH_MAX];
    
    log_msg("bb_unlink(path=\"%s\")\n",
	    path);
    bb_fullpath(fpath, path);

    return log_syscall("unlink", unlink(fpath), 0);
}

/** Remove a directory */
int bb_rmdir(const char *path)
{
    char fpath[PATH_MAX];
    
    log_msg("bb_rmdir(path=\"%s\")\n",
	    path);
    bb_fullpath(fpath, path);

    return log_syscall("rmdir", rmdir(fpath), 0);
}

/** Create a symbolic link */
// The parameters here are a little bit confusing, but do correspond
// to the symlink() system call.  The 'path' is where the link points,
// while the 'link' is the link itself.  So we need to leave the path
// unaltered, but insert the link into the mounted directory.
int bb_symlink(const char *path, const char *link)
{
    char flink[PATH_MAX];
    
    log_msg("\nbb_symlink(path=\"%s\", link=\"%s\")\n",
	    path, link);
    bb_fullpath(flink, link);

    return log_syscall("symlink", symlink(path, flink), 0);
}

/** Rename a file */
// both path and newpath are fs-relative
int bb_rename(const char *path, const char *newpath)
{
    char fpath[PATH_MAX];
    char fnewpath[PATH_MAX];
    
    log_msg("\nbb_rename(fpath=\"%s\", newpath=\"%s\")\n",
	    path, newpath);
    bb_fullpath(fpath, path);
    bb_fullpath(fnewpath, newpath);

    return log_syscall("rename", rename(fpath, fnewpath), 0);
}

/** Create a hard link to a file */
int bb_link(const char *path, const char *newpath)
{
    char fpath[PATH_MAX], fnewpath[PATH_MAX];
    
    log_msg("\nbb_link(path=\"%s\", newpath=\"%s\")\n",
	    path, newpath);
    bb_fullpath(fpath, path);
    bb_fullpath(fnewpath, newpath);

    return log_syscall("link", link(fpath, fnewpath), 0);
}

/** Change the permission bits of a file */
int bb_chmod(const char *path, mode_t mode)
{
    char fpath[PATH_MAX];
    
    log_msg("\nbb_chmod(fpath=\"%s\", mode=0%03o)\n",
	    path, mode);
    bb_fullpath(fpath, path);

    return log_syscall("chmod", chmod(fpath, mode), 0);
}

/** Change the owner and group of a file */
int bb_chown(const char *path, uid_t uid, gid_t gid)
  
{
    char fpath[PATH_MAX];
    
    log_msg("\nbb_chown(path=\"%s\", uid=%d, gid=%d)\n",
	    path, uid, gid);
    bb_fullpath(fpath, path);

    return log_syscall("chown", chown(fpath, uid, gid), 0);
}

/** Change the size of a file */
int bb_truncate(const char *path, off_t newsize)
{
    char fpath[PATH_MAX];
    
    log_msg("\nbb_truncate(path=\"%s\", newsize=%lld)\n",
	    path, newsize);
    bb_fullpath(fpath, path);

    return log_syscall("truncate", truncate(fpath, newsize), 0);
}

/** Change the access and/or modification times of a file */
/* note -- I'll want to change this as soon as 2.6 is in debian testing */
int bb_utime(const char *path, struct utimbuf *ubuf)
{
    char fpath[PATH_MAX];
    
    log_msg("\nbb_utime(path=\"%s\", ubuf=0x%08x)\n",
	    path, ubuf);
    bb_fullpath(fpath, path);

    return log_syscall("utime", utime(fpath, ubuf), 0);
}

/** File open operation
 *
 * No creation, or truncation flags (O_CREAT, O_EXCL, O_TRUNC)
 * will be passed to open().  Open should check if the operation
 * is permitted for the given flags.  Optionally open may also
 * return an arbitrary filehandle in the fuse_file_info structure,
 * which will be passed to all file operations.
 *
 * Changed in version 2.2
 */
int bb_open(const char *path, struct fuse_file_info *fi)
{
    int retstat = 0;
    int fd;
    char fpath[PATH_MAX];
    
    log_msg("\nbb_open(path\"%s\", fi=0x%08x)\n",
	    path, fi);
    bb_fullpath(fpath, path);
    
    // if the open call succeeds, my retstat is the file descriptor,
    // else it's -errno.  I'm making sure that in that case the saved
    // file descriptor is exactly -1.
    fd = log_syscall("open", open(fpath, fi->flags), 0);
    if (fd < 0)
	retstat = log_error("open");
	
    fi->fh = fd;

    log_fi(fi);
    
    return retstat;
}

/** Read data from an open file
 *
 * Read should return exactly the number of bytes requested except
 * on EOF or error, otherwise the rest of the data will be
 * substituted with zeroes.  An exception to this is when the
 * 'direct_io' mount option is specified, in which case the return
 * value of the read system call will reflect the return value of
 * this operation.
 *
 * Changed in version 2.2
 */
// I don't fully understand the documentation above -- it doesn't
// match the documentation for the read() system call which says it
// can return with anything up to the amount of data requested. nor
// with the fusexmp code which returns the amount of data also
// returned by read.
int bb_read(const char *path, char *buf, size_t size, off_t offset, struct fuse_file_info *fi)
{
    int retstat = 0;
    
    log_msg("\nbb_read(path=\"%s\", buf=0x%08x, size=%d, offset=%lld, fi=0x%08x)\n",
	    path, buf, size, offset, fi);
    // no need to get fpath on this one, since I work from fi->fh not the path
    log_fi(fi);

    return log_syscall("pread", pread(fi->fh, buf, size, offset), 0);
}

/** Write data to an open file
 *
 * Write should return exactly the number of bytes requested
 * except on error.  An exception to this is when the 'direct_io'
 * mount option is specified (see read operation).
 *
 * Changed in version 2.2
 */
// As  with read(), the documentation above is inconsistent with the
// documentation for the write() system call.
int bb_write(const char *path, const char *buf, size_t size, off_t offset,
	     struct fuse_file_info *fi)
{
    int retstat = 0;
    
    log_msg("\nbb_write(path=\"%s\", buf=0x%08x, size=%d, offset=%lld, fi=0x%08x)\n",
	    path, buf, size, offset, fi
	    );
    // no need to get fpath on this one, since I work from fi->fh not the path
    log_fi(fi);

    return log_syscall("pwrite", pwrite(fi->fh, buf, size, offset), 0);
}

/** Get file system statistics
 *
 * The 'f_frsize', 'f_favail', 'f_fsid' and 'f_flag' fields are ignored
 *
 * Replaced 'struct statfs' parameter with 'struct statvfs' in
 * version 2.5
 */
int bb_statfs(const char *path, struct statvfs *statv)
{
    int retstat = 0;
    char fpath[PATH_MAX];
    
    log_msg("\nbb_statfs(path=\"%s\", statv=0x%08x)\n",
	    path, statv);
    bb_fullpath(fpath, path);
    
    // get stats for underlying filesystem
    retstat = log_syscall("statvfs", statvfs(fpath, statv), 0);
    
    log_statvfs(statv);
    
    return retstat;
}

/** Possibly flush cached data
 *
 * BIG NOTE: This is not equivalent to fsync().  It's not a
 * request to sync dirty data.
 *
 * Flush is called on each close() of a file descriptor.  So if a
 * filesystem wants to return write errors in close() and the file
 * has cached dirty data, this is a good place to write back data
 * and return any errors.  Since many applications ignore close()
 * errors this is not always useful.
 *
 * NOTE: The flush() method may be called more than once for each
 * open().  This happens if more than one file descriptor refers
 * to an opened file due to dup(), dup2() or fork() calls.  It is
 * not possible to determine if a flush is final, so each flush
 * should be treated equally.  Multiple write-flush sequences are
 * relatively rare, so this shouldn't be a problem.
 *
 * Filesystems shouldn't assume that flush will always be called
 * after some writes, or that if will be called at all.
 *
 * Changed in version 2.2
 */
// this is a no-op in BBFS.  It just logs the call and returns success
int bb_flush(const char *path, struct fuse_file_info *fi)
{
    log_msg("\nbb_flush(path=\"%s\", fi=0x%08x)\n", path, fi);
    // no need to get fpath on this one, since I work from fi->fh not the path
    log_fi(fi);
	
    return 0;
}

/** Release an open file
 *
 * Release is called when there are no more references to an open
 * file: all file descriptors are closed and all memory mappings
 * are unmapped.
 *
 * For every open() call there will be exactly one release() call
 * with the same flags and file descriptor.  It is possible to
 * have a file opened more than once, in which case only the last
 * release will mean, that no more reads/writes will happen on the
 * file.  The return value of release is ignored.
 *
 * Changed in version 2.2
 */
int bb_release(const char *path, struct fuse_file_info *fi)
{
    log_msg("\nbb_release(path=\"%s\", fi=0x%08x)\n",
	  path, fi);
    log_fi(fi);

    // We need to close the file.  Had we allocated any resources
    // (buffers etc) we'd need to free them here as well.
    return log_syscall("close", close(fi->fh), 0);
}

/** Synchronize file contents
 *
 * If the datasync parameter is non-zero, then only the user data
 * should be flushed, not the meta data.
 *
 * Changed in version 2.2
 */
int bb_fsync(const char *path, int datasync, struct fuse_file_info *fi)
{
    log_msg("\nbb_fsync(path=\"%s\", datasync=%d, fi=0x%08x)\n",
	    path, datasync, fi);
    log_fi(fi);
    
    // some unix-like systems (notably freebsd) don't have a datasync call
#ifdef HAVE_FDATASYNC
    if (datasync)
	return log_syscall("fdatasync", fdatasync(fi->fh), 0);
    else
#endif	
	return log_syscall("fsync", fsync(fi->fh), 0);
}

#ifdef HAVE_SYS_XATTR_H
/** Note that my implementations of the various xattr functions use
    the 'l-' versions of the functions (eg bb_setxattr() calls
    lsetxattr() not setxattr(), etc).  This is because it appears any
    symbolic links are resolved before the actual call takes place, so
    I only need to use the system-provided calls that don't follow
    them */

/** Set extended attributes */
int bb_setxattr(const char *path, const char *name, const char *value, size_t size, int flags)
{
    char fpath[PATH_MAX];
    
    log_msg("\nbb_setxattr(path=\"%s\", name=\"%s\", value=\"%s\", size=%d, flags=0x%08x)\n",
	    path, name, value, size, flags);
    bb_fullpath(fpath, path);

    return log_syscall("lsetxattr", lsetxattr(fpath, name, value, size, flags), 0);
}

/** Get extended attributes */
int bb_getxattr(const char *path, const char *name, char *value, size_t size)
{
    int retstat = 0;
    char fpath[PATH_MAX];
    
    log_msg("\nbb_getxattr(path = \"%s\", name = \"%s\", value = 0x%08x, size = %d)\n",
	    path, name, value, size);
    bb_fullpath(fpath, path);

    retstat = log_syscall("lgetxattr", lgetxattr(fpath, name, value, size), 0);
    if (retstat >= 0)
	log_msg("    value = \"%s\"\n", value);
    
    return retstat;
}

/** List extended attributes */
int bb_listxattr(const char *path, char *list, size_t size)
{
    int retstat = 0;
    char fpath[PATH_MAX];
    char *ptr;
    
    log_msg("\nbb_listxattr(path=\"%s\", list=0x%08x, size=%d)\n",
	    path, list, size
	    );
    bb_fullpath(fpath, path);

    retstat = log_syscall("llistxattr", llistxattr(fpath, list, size), 0);
    if (retstat >= 0) {
	log_msg("    returned attributes (length %d):\n", retstat);
	if (list != NULL)
	    for (ptr = list; ptr < list + retstat; ptr += strlen(ptr)+1)
		log_msg("    \"%s\"\n", ptr);
	else
	    log_msg("    (null)\n");
    }
    
    return retstat;
}

/** Remove extended attributes */
int bb_removexattr(const char *path, const char *name)
{
    char fpath[PATH_MAX];
    
    log_msg("\nbb_removexattr(path=\"%s\", name=\"%s\")\n",
	    path, name);
    bb_fullpath(fpath, path);

    return log_syscall("lremovexattr", lremovexattr(fpath, name), 0);
}
#endif

/** Open directory
 *
 * This method should check if the open operation is permitted for
 * this  directory
 *
 * Introduced in version 2.3
 */
int bb_opendir(const char *path, struct fuse_file_info *fi)
{
    DIR *dp;
    int retstat = 0;
    char fpath[PATH_MAX];
    
    log_msg("\nbb_opendir(path=\"%s\", fi=0x%08x)\n",
	  path, fi);
    bb_fullpath(fpath, path);

    // since opendir returns a pointer, takes some custom handling of
    // return status.
    dp = opendir(fpath);
    log_msg("    opendir returned 0x%p\n", dp);
    if (dp == NULL)
	retstat = log_error("bb_opendir opendir");
    
    fi->fh = (intptr_t) dp;
    
    log_fi(fi);
    
    return retstat;
}

/** Read directory
 *
 * This supersedes the old getdir() interface.  New applications
 * should use this.
 *
 * The filesystem may choose between two modes of operation:
 *
 * 1) The readdir implementation ignores the offset parameter, and
 * passes zero to the filler function's offset.  The filler
 * function will not return '1' (unless an error happens), so the
 * whole directory is read in a single readdir operation.  This
 * works just like the old getdir() method.
 *
 * 2) The readdir implementation keeps track of the offsets of the
 * directory entries.  It uses the offset parameter and always
 * passes non-zero offset to the filler function.  When the buffer
 * is full (or an error happens) the filler function will return
 * '1'.
 *
 * Introduced in version 2.3
 */

int bb_readdir(const char *path, void *buf, fuse_fill_dir_t filler, off_t offset,
	       struct fuse_file_info *fi)
{
    int retstat = 0;
    DIR *dp;
    struct dirent *de;
    
    log_msg("\nbb_readdir(path=\"%s\", buf=0x%08x, filler=0x%08x, offset=%lld, fi=0x%08x)\n",
	    path, buf, filler, offset, fi);
    // once again, no need for fullpath -- but note that I need to cast fi->fh
    dp = (DIR *) (uintptr_t) fi->fh;

    // Every directory contains at least two entries: . and ..  If my
    // first call to the system readdir() returns NULL I've got an
    // error; near as I can tell, that's the only condition under
    // which I can get an error from readdir()
    de = readdir(dp);
    log_msg("    readdir returned 0x%p\n", de);
    if (de == 0) {
	retstat = log_error("bb_readdir readdir");
	return retstat;
    }

    // This will copy the entire directory into the buffer.  The loop exits
    // when either the system readdir() returns NULL, or filler()
    // returns something non-zero.  The first case just means I've
    // read the whole directory; the second means the buffer is full.
    do {
	log_msg("calling filler with name %s\n", de->d_name);
	if (filler(buf, de->d_name, NULL, 0) != 0) {
	    log_msg("    ERROR bb_readdir filler:  buffer full");
	    return -ENOMEM;
	}
    } while ((de = readdir(dp)) != NULL);
    
    log_fi(fi);
    
    return retstat;
}

/** Release directory
 *
 * Introduced in version 2.3
 */
int bb_releasedir(const char *path, struct fuse_file_info *fi)
{
    int retstat = 0;
    
    log_msg("\nbb_releasedir(path=\"%s\", fi=0x%08x)\n",
	    path, fi);
    log_fi(fi);
    
    closedir((DIR *) (uintptr_t) fi->fh);
    
    return retstat;
}

/** Synchronize directory contents
 *
 * If the datasync parameter is non-zero, then only the user data
 * should be flushed, not the meta data
 *
 * Introduced in version 2.3
 */
// when exactly is this called?  when a user calls fsync and it
// happens to be a directory? ??? >>> I need to implement this...
int bb_fsyncdir(const char *path, int datasync, struct fuse_file_info *fi)
{
    int retstat = 0;
    
    log_msg("\nbb_fsyncdir(path=\"%s\", datasync=%d, fi=0x%08x)\n",
	    path, datasync, fi);
    log_fi(fi);
    
    return retstat;
}

/**
 * Initialize filesystem
 *
 * The return value will passed in the private_data field of
 * fuse_context to all file operations and as a parameter to the
 * destroy() method.
 *
 * Introduced in version 2.3
 * Changed in version 2.6
 */
// Undocumented but extraordinarily useful fact:  the fuse_context is
// set up before this function is called, and
// fuse_get_context()->private_data returns the user_data passed to
// fuse_main().  Really seems like either it should be a third
// parameter coming in here, or else the fact should be documented
// (and this might as well return void, as it did in older versions of
// FUSE).
void *bb_init(struct fuse_conn_info *conn)
{
    log_msg("\nbb_init()\n");
    
    log_conn(conn);
    log_fuse_context(fuse_get_context());
    
    return BB_DATA;
}

/**
 * Clean up filesystem
 *
 * Called on filesystem exit.
 *
 * Introduced in version 2.3
 */
void bb_destroy(void *userdata)
{
    log_msg("\nbb_destroy(userdata=0x%08x)\n", userdata);
}

/**
 * Check file access permissions
 *
 * This will be called for the access() system call.  If the
 * 'default_permissions' mount option is given, this method is not
 * called.
 *
 * This method is not called under Linux kernel versions 2.4.x
 *
 * Introduced in version 2.5
 */
int bb_access(const char *path, int mask)
{
    int retstat = 0;
    char fpath[PATH_MAX];
   
    log_msg("\nbb_access(path=\"%s\", mask=0%o)\n",
	    path, mask);
    bb_fullpath(fpath, path);
    
    retstat = access(fpath, mask);
    
    if (retstat < 0)
	retstat = log_error("bb_access access");
    
    return retstat;
}

/**
 * Create and open a file
 *
 * If the file does not exist, first create it with the specified
 * mode, and then open it.
 *
 * If this method is not implemented or under Linux kernel
 * versions earlier than 2.6.15, the mknod() and open() methods
 * will be called instead.
 *
 * Introduced in version 2.5
 */
// Not implemented.  I had a version that used creat() to create and
// open the file, which it turned out opened the file write-only.

/**
 * Change the size of an open file
 *
 * This method is called instead of the truncate() method if the
 * truncation was invoked from an ftruncate() system call.
 *
 * If this method is not implemented or under Linux kernel
 * versions earlier than 2.6.15, the truncate() method will be
 * called instead.
 *
 * Introduced in version 2.5
 */
int bb_ftruncate(const char *path, off_t offset, struct fuse_file_info *fi)
{
    int retstat = 0;
    
    log_msg("\nbb_ftruncate(path=\"%s\", offset=%lld, fi=0x%08x)\n",
	    path, offset, fi);
    log_fi(fi);
    
    retstat = ftruncate(fi->fh, offset);
    if (retstat < 0)
	retstat = log_error("bb_ftruncate ftruncate");
    
    return retstat;
}

/**
 * Get attributes from an open file
 *
 * This method is called instead of the getattr() method if the
 * file information is available.
 *
 * Currently this is only called after the create() method if that
 * is implemented (see above).  Later it may be called for
 * invocations of fstat() too.
 *
 * Introduced in version 2.5
 */
int bb_fgetattr(const char *path, struct stat *statbuf, struct fuse_file_info *fi)
{
    int retstat = 0;
    
    log_msg("\nbb_fgetattr(path=\"%s\", statbuf=0x%08x, fi=0x%08x)\n",
	    path, statbuf, fi);
    log_fi(fi);

    // On FreeBSD, trying to do anything with the mountpoint ends up
    // opening it, and then using the FD for an fgetattr.  So in the
    // special case of a path of "/", I need to do a getattr on the
    // underlying root directory instead of doing the fgetattr().
    if (!strcmp(path, "/"))
	return bb_getattr(path, statbuf);
    
    retstat = fstat(fi->fh, statbuf);
    if (retstat < 0)
	retstat = log_error("bb_fgetattr fstat");
    
    log_stat(statbuf);
    
    return retstat;
}

struct fuse_operations bb_oper = {
  .getattr = bbfs_getattr,
  .readlink = bb_readlink,
  // no .getdir -- that's deprecated
  .getdir = NULL,
  .mknod = bb_mknod,
  .mkdir = bb_mkdir,
  .unlink = bbfs_unlink,
  .rmdir = bb_rmdir,
  .symlink = bb_symlink,
  .rename = bb_rename,
  .link = bb_link,
  .chmod = bb_chmod,
  .chown = bb_chown,
  .truncate = bb_truncate,
  .utime = bb_utime,
  .open = bb_open,
  .read = bbfs_read,
  .write = bbfs_write,
  /** Just a placeholder, don't set */ // huh???
  .statfs = bb_statfs,
  .flush = bb_flush,
  .release = bb_release,
  .fsync = bb_fsync,
  
#ifdef HAVE_SYS_XATTR_H
  .setxattr = bb_setxattr,
  .getxattr = bb_getxattr,
  .listxattr = bb_listxattr,
  .removexattr = bb_removexattr,
#endif
  
  .opendir = bb_opendir,
  .readdir = bb_readdir,
  .releasedir = bb_releasedir,
  .fsyncdir = bb_fsyncdir,
  .init = bbfs_init,
  .destroy = bbfs_destroy,
  .access = bb_access,
  .ftruncate = bb_ftruncate,
  .fgetattr = bb_fgetattr
};

void bb_usage()
{
    fprintf(stderr, "usage:  bbfs [FUSE and mount options] rootDir mountPoint\n");
    abort();
}

int main(int argc, char *argv[])
{
    int fuse_stat;
    struct bb_state *bb_data;

    // bbfs doesn't do any access checking on its own (the comment
    // blocks in fuse.h mention some of the functions that need
    // accesses checked -- but note there are other functions, like
    // chown(), that also need checking!).  Since running bbfs as root
    // will therefore open Metrodome-sized holes in the system
    // security, we'll check if root is trying to mount the filesystem
    // and refuse if it is.  The somewhat smaller hole of an ordinary
    // user doing it with the allow_other flag is still there because
    // I don't want to parse the options string.
    if ((getuid() == 0) || (geteuid() == 0)) {
    	fprintf(stderr, "Running BBFS as root opens unnacceptable security holes\n");
    	return 1;
    }

    char cwd[PATH_MAX];
    if (getcwd(cwd, sizeof(cwd)) != NULL) {
        printf("bbfs_init running in directory: %s\n", cwd);
    } else {
        perror("getcwd() error");
    }

    if (getcwd(STORAGE_DIR, sizeof(STORAGE_DIR)) == NULL) {
        perror("getcwd");
        exit(1);
    }

    size_t len = strlen(STORAGE_DIR);
    if (len > 0 && STORAGE_DIR[len - 1] != '/') {
        strcat(STORAGE_DIR, "/");
    }

    strcat(STORAGE_DIR, "storage/");

    // See which version of fuse we're running
    fprintf(stderr, "Fuse library version %d.%d\n", FUSE_MAJOR_VERSION, FUSE_MINOR_VERSION);
    
    // Perform some sanity checking on the command line:  make sure
    // there are enough arguments, and that neither of the last two
    // start with a hyphen (this will break if you actually have a
    // rootpoint or mountpoint whose name starts with a hyphen, but so
    // will a zillion other programs)
    if ((argc < 3) || (argv[argc-2][0] == '-') || (argv[argc-1][0] == '-'))
	bb_usage();

    bb_data = malloc(sizeof(struct bb_state));
    if (bb_data == NULL) {
	perror("main calloc");
	abort();
    }

    // Pull the rootdir out of the argument list and save it in my
    // internal data
    bb_data->rootdir = realpath(argv[argc-2], NULL);
    argv[argc-2] = argv[argc-1];
    argv[argc-1] = NULL;
    argc--;
    
    bb_data->logfile = log_open();
    
    // turn over control to fuse
    fprintf(stderr, "about to call fuse_main\n");
    fuse_stat = fuse_main(argc, argv, &bb_oper, bb_data);
    fprintf(stderr, "fuse_main returned %d\n", fuse_stat);
    
    return fuse_stat;
}
