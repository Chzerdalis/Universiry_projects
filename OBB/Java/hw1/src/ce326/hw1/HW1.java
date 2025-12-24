package ce326.hw1;

import java.util.Scanner;

public class HW1 {
    public static void main(String[] args) {
        String word;
        int k;
        Trie tree = new Trie();
        Scanner sc = new Scanner(System.in);

        System.out.println("?: ");
        while(sc.hasNext()) {
            switch (sc.next()) {
                case "-i":
                    word = sc.next();
                    if(checkWord(word)) {
                        word = word.toLowerCase();
                        k = tree.add(word);
                        if (k == 1) {
                            System.out.println("ADD " + word + " OK");
                        } else {
                            System.out.println("ADD " + word + " NOK");
                        }
                    }
                    break;
                case "-p":
                    System.out.print("PreOrder: ");
                    tree.preOrder(tree.root);
                    break;
                case "-d":
                    System.out.print("\n***** Dictionary *****\n");
                    tree.searchPrint(tree.root, null, -1);
                    break;
                case "-w":
                    word = sc.next();
                    if(checkWord(word)) {
                        word = word.toLowerCase();
                        k = Integer.parseInt(sc.next());
                        System.out.println("\nDistant words of " + word + " (" + k + "):");
                        tree.searchPrint(tree.root, word, k);
                    }
                    break;
                case "-s":
                    word = sc.next();
                    if(checkWord(word)) {
                        word = word.toLowerCase();
                        System.out.println("\nWords with suffix " + word + ':');
                        tree.searchPrint(tree.root, word, -1);
                    }
                    break;
                case "-f":
                    word = sc.next();
                    if(checkWord(word)) {
                        word = word.toLowerCase();
                        if (tree.find(word) != null) {
                            System.out.println("FND " + word + " OK");
                        } else {
                            System.out.println("FND " + word + " NOK");
                        }
                    }
                    break;
                case "-r":
                    word = sc.next();
                    if(checkWord(word)) {
                        word = word.toLowerCase();
                        k = tree.remove(word);
                        if (k == 1) {
                            System.out.println("RMV " + word + " OK");
                        } else {
                            System.out.println("RMV " + word + " NOK");
                        }
                    }
                    break;
                case "-q":
                    System.out.println("Bye bye!");
                    return;
                default:
                    System.out.println("Wrong command!!!!!!!");
                    break;
            }
            System.out.println("?: ");
        }
    }
    //checks if the string has only letters
    static boolean checkWord(String word) {
        int i;
        for(i = 0; i < word.length(); i++) {
            if(word.charAt(i) > 'z' || word.charAt(i) < 'A') {
                return false;
            }
        }
        return true;
    }
}