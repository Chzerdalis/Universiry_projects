package ce326.hw1;

public class Trie {
    TrieNode root;
    String word;
    Trie() {
        root = new TrieNode();
    }
    //turns a character in to the right number for the children array
    private int charToNum(char a) {
        return a - 'z' + 25;
    }
    //checks how many different letters two same length words have
    private int checkDiff(String one, String two) {
        int y = one.length(), i, k = 0;

        for(i = 0; i < y; i++) {
            if(one.charAt(i) != two.charAt(i)) {
                k++;
            }
        }
        return k;
    }
    //prints pre order
    void preOrder(TrieNode node) {
        if (node.isWord && node.letters != null) {
            System.out.print(node.letters + "# ");
        } else if (node.letters != null) {
            System.out.print(node.letters + ' ');
        }

        for (int i = 0; i < 26; i++) {
            if (node.children[i] != null) {
                preOrder(node.children[i]);
            }
        }
        if (node == root) System.out.print("\n");
    }
    //add to the tree
    int add(String word) {
        int length1 = word.length();
        int i = 0, mode = 0, j = 0, length2 = 0, cas;
        TrieNode node = this.root, newNode, newNode1;
        //according to the word given chooses the right(mode 0) child and the
        //compares its contents with the word(mode 1) until it reaches one the 3 cases
        while (true) {
            if (mode == 0) {
                if (node.children[charToNum(word.charAt(i))] != null) {
                    node = node.children[charToNum(word.charAt(i))];
                    mode = 1;
                } else {
                    cas = 1;
                    break;
                }
            } else {
                length2 = node.letters.length();
                for (j = 0; j < length2 && i < length1; i++, j++) {
                    if (word.charAt(i) != node.letters.charAt(j)) {
                        break;
                    }
                }
                if (j == length2 && i == length1) {
                    if (node.isWord) {
                        return 0;
                    } else {
                        node.isWord = true;
                        return 1;
                    }
                } else if (j == length2) {
                    mode = 0;
                } else if (i == length1) {
                    cas = 2;
                    break;
                } else {
                    cas = 3;
                    break;
                }
            }

        }

        if (cas == 1) {
            //System.out.println("case 1");
            newNode = new TrieNode();

            node.children[charToNum(word.charAt(i))] = newNode;

            newNode.father = node;
            newNode.isWord = true;
            newNode.letters = word.substring(i, length1);

            return 1;
        } else if (cas == 2) {
            //System.out.println("case 2");
            newNode = new TrieNode();

            newNode.letters = word.substring(i - j, i);
            newNode.isWord = true;
            newNode.father = node.father;
            newNode.children[charToNum(node.letters.charAt(j))] = node;

            node.father.children[charToNum(node.letters.charAt(0))] = newNode;
            node.father = newNode;
            node.letters = node.letters.substring(j, length2);

            return 1;
        } else {
            //System.out.println("case 3");
            newNode = new TrieNode();
            newNode1 = new TrieNode();

            newNode.letters = word.substring(i - j, i);
            newNode.father = node.father;
            newNode.children[charToNum(node.letters.charAt(j))] = node;
            newNode.children[charToNum(word.charAt(i))] = newNode1;

            node.father.children[charToNum(node.letters.charAt(0))] = newNode;
            node.father = newNode;
            node.letters = node.letters.substring(j, length2);

            newNode1.father = newNode;
            newNode1.isWord = true;
            newNode1.letters = word.substring(i, length1);
            return 1;
        }
    }
    //finds word in the tree and returns its final node
    TrieNode find(String word) {
        int length1 = word.length();
        int i = 0, mode = 0, j, length2;
        TrieNode node = this.root;
        //uses the same logic as the add function until it checks
        //all the letters of the given word
        while (true) {
            if (mode == 0) {
                if (node.children[charToNum(word.charAt(i))] != null) {
                    node = node.children[charToNum(word.charAt(i))];
                    mode = 1;
                } else {
                    return null;
                }
            }else {
                length2 = node.letters.length();
                for (j = 0; j < length2 && i < length1; i++, j++) {
                    if (word.charAt(i) != node.letters.charAt(j)) {
                        break;
                    }
                }
                if (j == length2 && i == length1) {
                    if (node.isWord) {
                        return node;
                    } else {
                        return null;
                    }
                }else if(j == length2) {
                    mode = 0;
                }else{
                    return null;
                }
            }
        }
    }
    //searches all the tree and prints words according to what is asked in the arguments
    void searchPrint(TrieNode node, String word, int x) {
        String buffer;
        //the contents of the nodes are added(when it moves to child)
        //or subtracted(when it moves to father) from
        //the String (this.)word
        buffer = this.word;
        if(node.letters != null && this.word != null) {
            this.word = this.word + node.letters;
        }else if(node.letters != null) {
            this.word = node.letters;
        }
        //different path for every method(suffix ,dictionary, distance)
        if(word == null) {
            if(node.isWord) {
                System.out.println(this.word);
            }
        }else if(x == -1){
            if (node.isWord && this.word.endsWith(word)) {
                System.out.println(this.word);
            }
        }else if(this.word != null){
            if (this.word.length() > word.length()) {
                this.word = buffer;
                return;
            }else if(this.word.length() == word.length() && node.isWord) {
                if(checkDiff(this.word, word) == x) {
                    System.out.println(this.word);
                }
                this.word = buffer;
                return;
            }
        }

        for (int i = 0; i < 26; i++) {
            if (node.children[i] != null) {
                searchPrint(node.children[i], word, x);
            }
        }
        this.word = buffer;
        if (node == root) System.out.print("\n");
    }
    //removes word from the tree and reorganises it
    int remove(String word) {
        TrieNode node;
        int k;
        node = find(word);
        if(node == null) {
            return 0;
        }else{
            node.isWord = false;
            if(node.isEmpty()) {
                node.father.children[charToNum(node.letters.charAt(0))] = null;
                if(!node.father.isWord && node.father.father != null) {
                    k = node.father.hasOneChild();
                    if(k != -1) {
                        node.father.children[k].letters = node.father.letters + node.father.children[k].letters;
                        node.father.children[k].father = node.father.father;
                        node.father.father.children[charToNum(node.father.letters.charAt(0))] = node.father.children[k];
                    }
                }
            }else if((k = node.hasOneChild()) != -1) {
                node.children[k].letters = node.letters + node.children[k].letters;
                node.children[k].father = node.father;
                node.father.children[charToNum(node.letters.charAt(0))] = node.children[k];
            }
            return 1;
        }
    }
}
