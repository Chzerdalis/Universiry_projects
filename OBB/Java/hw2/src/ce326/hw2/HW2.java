package ce326.hw2;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Objects;
import java.util.Scanner;
import org.json.JSONException;
import org.json.JSONObject;

public class HW2 {
    public static void main(String[] args) {
        Board game = new Board();
        Scanner sc = new Scanner(System.in);
        String word, word2;
        int  res;
        int[] coordinates;
        //mode is for print d or not
        boolean mode = false, gameLive = false;
        String filePath = null;

        System.out.println("- Load Game      (L/l)");
        System.out.println("- Quit           (Q/q)" + "\n");
        System.out.println("Your option:");
        while (sc.hasNext()) {
            word = sc.next();
            if (Objects.equals(word, "L") || Objects.equals(word, "l")) {
                System.out.print("Enter input filename:");
                filePath = sc.nextLine();
                filePath = sc.nextLine();

                try {
                    String contents = new String(Files.readAllBytes(Paths.get(filePath)));
                    try {
                        JSONObject obj = new JSONObject(contents);
                        if(game.initBoard(obj) != -1) {
                            gameLive = true;
                            game.printBoard(mode);
                            break;
                        }
                        System.out.println("Illegal arguments in 'FILE' \n");
                    } catch (JSONException ex) {
                        System.out.println("\nFile NOT in JSON format\n");
                    }
                } catch (IOException e) {
                    System.out.println("\nUnable to read 'FILE' \n");
                }
            } else if (Objects.equals(word, "Q") || Objects.equals(word, "q")) {
                return;
            } else {
                System.out.println("Invalid option \n");
            }
            System.out.println("- Load Game      (L/l)");
            System.out.println("- Quit           (Q/q)" + "\n");
            System.out.println("Your option:");
        }
        System.out.print("Input: ");
        while (!gameLive || sc.hasNext()) {
            if(gameLive) {
                word = sc.next();
            }else {
                word = "Z";
            }
            System.out.println();

            while(Objects.equals(word, "Z") || Objects.equals(word, "z")) {
                System.out.println("- Load Game      (L/l)");
                System.out.println("- Debug Dijkstra (D/d)");
                System.out.println("- Show History   (H/h)");
                System.out.println("- Jump to move   (J/j)");
                System.out.println("- Continue game  (C/c)");
                System.out.println("- Quit           (Q/q)" + "\n");
                System.out.print("Your option:");

                word2 = sc.next();
                System.out.println();

                if(Objects.equals(word2, "L") || Objects.equals(word2, "l")) {
                    System.out.print("Enter input filename:");
                    filePath = sc.nextLine();
                    filePath = sc.nextLine();
                    //String first = "C:\\Users\\Χριστόδουλος\\JAVA\\hw2\\src\\ce326\\hw\\package.json";
                    try {
                        String contents = new String(Files.readAllBytes(Paths.get(filePath)));
                        try {
                            JSONObject obj = new JSONObject(contents);
                            if(game.initBoard(obj) != -1) {
                                gameLive = true;
                                game.printBoard(mode);
                                break;
                            }
                            System.out.println("Illegal arguments in 'FILE' \n");
                        } catch (JSONException ex) {
                            System.out.println("\nFile NOT in JSON format\n");
                        }
                    } catch (IOException e) {
                        System.out.println("\nUnable to read 'FILE' \n");
                    }
                } else if (Objects.equals(word2, "D") || Objects.equals(word2, "d")) {
                    if(!mode) {
                        mode = true;
                    }else {
                        mode = false;
                    }
                } else if (Objects.equals(word2, "H") || Objects.equals(word2, "h")) {
                    game.printHistory();
                } else if (Objects.equals(word2, "J") || Objects.equals(word2, "j")) {
                    System.out.print("Enter move number: ");
                    if(game.jump(Integer.parseInt(sc.next()), filePath) == -1){
                        System.out.println("Wrong number \n");
                    }else if(!gameLive){
                        gameLive = true;
                    }
                } else if (Objects.equals(word2, "C") || Objects.equals(word2, "c")) {
                    if(gameLive) {
                        game.printBoard(mode);
                        break;
                    }else{
                        System.out.println("GAME OVER\n");
                    }
                } else if (Objects.equals(word2, "Q") || Objects.equals(word2, "q")) {
                    return;
                } else {
                    System.out.println("Invalid option\n");
                }
            }
            if(!Objects.equals(word, "Z") && !Objects.equals(word, "z")) {
                coordinates = game.getCoordinates(word, false);
                res = game.moveActor(coordinates[0], coordinates[1]);
                if (res == -2) {
                    //game.printBoard(mode);
                    System.out.println("YOU LOST\n");
                    gameLive = false;
                }else if (res == -1) {
                    System.out.println("Invalid input. Try again... \n");
                }else if (res == 1) {
                    //game.printBoard(mode);
                    System.out.println("YOU WON\n");
                    gameLive = false;
                }else{
                    game.printBoard(mode);
                }
            }
            System.out.print("Input: ");
        }
    }
}

