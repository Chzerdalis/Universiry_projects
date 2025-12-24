package ce326.hw1;

public class TrieNode {
    //every node has 26 possible childer
    TrieNode[] children = new TrieNode[26];
    //the contents of the node
    String letters;
    //true if the node is an end of a word
    boolean isWord;
    //pointer to the nodes father
    TrieNode father;

    TrieNode() {
        for(int i = 0; i < 26; i++) {
            this.children[i] = null;
        }
        this.father = null;
        this.isWord = false;
    }
    //checks if the node has any children
    boolean isEmpty() {
        for(int i = 0; i < 26; i++) {
            if(children[i] != null) return false;
        }
        return true;
    }
    //check if node has only one child
    int hasOneChild() {
        int i, y = 0, z = 0;
        for(i = 0; i < 26; i++) {
            if(children[i] != null) {
                y++;
                z = i;
            }
        }
        if(y == 1) {
            return z;
        }else {
            return -1;
        }
    }

}
