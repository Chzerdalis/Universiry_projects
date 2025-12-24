package ce326.hw2;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Objects;


public class Board {
    BoardCell[][] cells;
    //winNumber is remaining cells to be surpassed,
    //numOfMoves is the number of actor and ghost moves for the history
    int numRows, numCols, winNumber, numOfMoves;
    Actor actor = new Actor();
    Ghost[] ghosts = null;
    //obj1 is the main history, obj2 the buffer history
    JSONObject obj1, obj2;

    int initBoard(JSONObject o){
        int rows, columns, energy, i, j = 0, k = 0;
        JSONArray board;
        String word;

        rows = o.getInt("rows");
        columns = o.getInt("columns");
        energy = o.getInt("energy");
        board = o.getJSONArray("init");

        if(rows <= 0 || columns <= 0 || energy <= 0 || board.length() != rows*columns) {
            return -1;
        }

        winNumber = rows*columns - 1;
        numRows = rows;
        numCols = columns;
        obj1 = new JSONObject();
        numOfMoves = 0;
        //initialize ghost array
        for(i = 0; i < rows*columns; i++) {
            word = board.get(i).toString();
            if(Objects.equals(word, "@")) {
                j++;
            }
        }
        ghosts = new Ghost[j];

        cells = new BoardCell[rows][columns];
        for(i = 0; i < rows; i++){
            for(j = 0; j < columns; j++){
                cells[i][j] = new BoardCell();
                word = board.get(j + i * columns).toString();

                if(Objects.equals(word, "#")) {
                    cells[i][j].addElement(new Obstacle());
                    cells[i][j].empty = false;
                    winNumber--;
                }else if(Objects.equals(word, "X")){
                    cells[i][j].addElement(actor);
                    cells[i][j].empty = false;
                    cells[i][j].surpassed = true;
                    actor.energy = energy;
                    actor.setPosition(i,j);
                }else if(Objects.equals(word, "v")) {
                    cells[i][j].addElement(new Vegetable());
                    cells[i][j].empty = false;
                }else if(Objects.equals(word, "f")) {
                    cells[i][j].addElement(new Fish());
                    cells[i][j].empty = false;
                }else if(Objects.equals(word, "m")) {
                    cells[i][j].addElement(new Meat());
                    cells[i][j].empty = false;
                }else if(Objects.equals(word, "@")) {
                    cells[i][j].addElement(new Ghost());
                    cells[i][j].empty = false;
                    ghosts[k] = new Ghost();
                    ghosts[k++].setPosition(i,j);
                }
            }
        }
        Dijkstra();
        return 1;
    }

    void printBoard(boolean mode) {
        int i, j, k = 0;
        char c = 'A';
        String Space = " ";

        if(mode) {
            for(i = 0; i < numRows; i++) {
                for(j = 0; j < numCols; j++) {
                    if(cells[i][j].distance >= 10) {
                        k = 1;
                        Space = "  ";
                    }
                }
            }
            System.out.print("  ");
            for(i = 1; i < numCols + 1; i++) {
                if(i >= 10){
                    System.out.print(STR."\{i} ");
                }else{
                    System.out.print(i + Space);
                }
            }
            System.out.println("\n");
            for(i = 0; i < numRows; i++) {
                System.out.print(STR."\{c}" + " ");
                if(k == 0) {Space = " ";}
                for(j = 0; j < numCols; j++) {
                    if(j > 8) {Space = "  ";}
                    if(cells[i][j].distance >= 10) {
                        System.out.print(cells[i][j].distance + " ");
                    }else if(cells[i][j].distance >= 0) {
                        System.out.print(cells[i][j].distance + Space);
                    }else if(cells[i][j].distance == -1 && !(cells[i][j].element[0] instanceof Obstacle)) {
                        System.out.print("?" + Space);
                    }else{
                        System.out.print("#" + Space);
                    }
                }
                System.out.println();
                c = (char) (c + 1);
            }
            System.out.println();
        }
        c = 'A';
        System.out.print("  ");
        for(i = 1; i < numCols + 1; i++) {
            System.out.print(i + " ");
        }
        System.out.println();
        for(i = 0; i < numRows; i++) {
            System.out.print(STR."\{c}" + " ");
            //System.out.print(STR."\{i + 1}" + " ");
            Space = " ";
            for(j = 0; j < numCols; j++) {
                if(j > 8) {Space = "  ";}
                if(cells[i][j].element[0] instanceof Obstacle) {
                    System.out.print(ANSI_YELLOW + "#" + Space + ANSI_RESET);
                }else if(cells[i][j].element[0] instanceof Actor) {
                    System.out.print(ANSI_BLUE + "X" + Space + ANSI_RESET);
                }else if(cells[i][j].element[0] instanceof Vegetable) {
                    System.out.print(ANSI_GREEN + "v" + Space + ANSI_RESET);
                }else if(cells[i][j].element[0] instanceof Fish) {
                    System.out.print(ANSI_GREEN +"f" + Space + ANSI_RESET);
                }else if(cells[i][j].element[0] instanceof Meat) {
                    System.out.print(ANSI_GREEN +"m" + Space + ANSI_RESET);
                }else if(cells[i][j].element[0] instanceof Ghost) {
                    System.out.print(ANSI_RED + "@" + Space + ANSI_RESET);
                }else if(!cells[i][j].surpassed){
                    System.out.print("-" + Space);
                }else {
                    System.out.print(" " + Space);
                }
            }
            System.out.println();
            c = (char) (c + 1);
        }
        System.out.println();
        System.out.println(STR."Actor Energy: \{actor.energy}");
    }

    int moveActor(int row, int col) {
        List<int[]> move = actor.moveOptions(this);
        int i;
        boolean isRight = false;

        for(i = 0; i < move.size(); i++) {
            if(row == move.get(i)[0] && col == move.get(i)[1]) {
                isRight = true;
                break;
            }
        }
        if(!isRight) {return -1;}

        if(cells[row][col].element[0] instanceof Ghost) {
            //moves into a ghost, no chance for the ghosts to move
            cells[actor.row][actor.column].rmvElement();
            actor.energy = 0;
            addHistory(actor.row, actor.column, row, col, true, false);
            //compensates for the non movement of ghosts
            numOfMoves--;
            return -2;
        }else if(cells[row][col].element[0] instanceof Vegetable || cells[row][col].element[0] instanceof Meat || cells[row][col].element[0] instanceof Fish) {
            //moves into food
            addHistory(actor.row, actor.column, row, col, true, false);
            actor.energy += ((Eatable) cells[row][col].element[0]).eaten() - 1;
            cells[row][col].rmvElement();
            cells[row][col].addElement(actor);
            cells[actor.row][actor.column].rmvElement();
            actor.setPosition(row,col);
            if(!cells[row][col].surpassed) {
                cells[row][col].surpassed = true;
                if(--winNumber == 0) {
                    //compensates for the non movement of ghosts
                    numOfMoves--;
                    return 1;
                }
            }
        }else{
            //moves to empty cell
            addHistory(actor.row, actor.column, row, col, true, false);
            actor.energy -= 1;
            cells[row][col].addElement(actor);
            cells[actor.row][actor.column].rmvElement();
            actor.setPosition(row,col);
            if(!cells[row][col].surpassed) {
                cells[row][col].surpassed = true;
                if(--winNumber == 0) {
                    //compensates for the non movement of ghosts
                    numOfMoves--;
                    return 1;
                }
            }
            //lose from 0 energy
            if(actor.energy == 0) {
                //compensates for the non movement of ghosts
                numOfMoves--;
                return -2;
            }
        }
        Dijkstra();
        //movement of ghosts
        if(moveGhosts() == -1) {
            actor.energy = 0;
            return -2;
        }
        return 0;
    }

    void addHistory(int x1, int y1, int x2, int y2, boolean type, boolean firstGhost) {
        String input = STR."\{giveStr(x1, y1)}-\{giveStr(x2, y2)}";
        //type ghost = false or actor = true
        //first ghost useful for the string adding
        if(type){
            this.obj1.put(String.valueOf(numOfMoves), input);
            if(ghosts.length == 0) {
                numOfMoves += 1;
                System.out.println("gay");
            }else{
                numOfMoves += 2;
            }
        }else{
            if (!firstGhost) {
                input = STR."\{this.obj1.get(String.valueOf(numOfMoves - 1))},\{input}";
            }
            this.obj1.put(String.valueOf(numOfMoves - 1), input);
        }
    }

    void printHistory() {
        int i;
        String buff;

        System.out.print("{\n");
        System.out.print("  \"moves\": {\n");
        for(i = 0; i < numOfMoves; i++) {
            buff = (String) obj1.get(String.valueOf(i));
            if(i == numOfMoves - 1) {
                System.out.print("    " + "\"" + i + "\"" + ":" + " " + "\"" + buff + "\"" +"\n");
            }else{
                System.out.print("    " + "\"" + i + "\"" + ":" + " " + "\"" + buff + "\"" + "," +"\n");
            }
        }
        System.out.print("  }\n");
        System.out.print("}\n\n");
    }

    int[] getCoordinates(String input, boolean type) {
        //get coordinates from string if type = true string = XY - KZ else string = XY
        int[] position = new int[2];
        int i;
        if(!type) {
            input = input.toLowerCase();
            position[0] = input.charAt(0) % 'a';
            for (i = 1; i < input.length(); i++) {
                position[1] = position[1] * 10 + (input.charAt(i) - '0');
            }
            position[1]--;
        }else{
            input = input.toLowerCase();
            for(i = 0; i <input.length(); i++) {
                if(input.charAt(i) == '-') {
                    position[0] = input.charAt(++i) % 'a';
                    for (i += 1; i < input.length(); i++) {
                        position[1] = position[1] * 10 + (input.charAt(i) - '0');
                    }
                    position[1]--;
                }
            }
        }
        return position;
    }

    String giveStr(int row, int col) {
        String str = "";
        str += (char) (row + 'A');
        str += col + 1;
        return str.toUpperCase();
    }

    void Dijkstra() {
        int i, j, k, min, row = 0, col = 0;
        int[][] dist = new int[numRows][numCols];
        boolean[][] visited = new boolean[numRows][numCols];
        int[] rowArr = new int[]{0, -1, 0, 1};
        int[] colArr = new int[]{-1, 0, 1, 0};

        for(i = 0; i < numRows; i++) {
            for(j = 0; j < numCols; j++) {
                dist[i][j] = Integer.MAX_VALUE;
                visited[i][j] = false;
            }
        }
        dist[actor.row][actor.column] = 0;
        for(i = 0; i < numRows*numCols; i++) {
            min = Integer.MAX_VALUE;
            for(j = 0; j < numRows; j++) {
                for(k = 0; k < numCols; k++) {
                    if(!visited[j][k] && dist[j][k] < min) {
                        min = dist[j][k];
                        row = j;
                        col = k;
                    }
                }
            }
            visited[row][col] = true;
            for(j = 0; j < 4; j++) {
                int newRow = row + rowArr[j];
                int newCol = col + colArr[j];

                if(newRow == -1) {newRow = numRows - 1;}
                else if(newRow == numRows) {newRow = 0;}
                if(newCol == -1) {newCol = numCols - 1;}
                else if(newCol == numCols) {newCol = 0;}

                if(!visited[newRow][newCol] && dist[row][col] + 1 < dist[newRow][newCol] && !(cells[newRow][newCol].element[0] instanceof Obstacle)) {
                    dist[newRow][newCol] = dist[row][col] + 1;
                }
            }
        }
        for(i = 0; i < numRows; i++) {
            for(j = 0; j < numCols; j++) {
                if(dist[i][j] == Integer.MAX_VALUE) {
                    cells[i][j].distance = -1;
                }else {
                    cells[i][j].distance = dist[i][j];
                }
            }
        }
    }

    int moveGhosts() {
        List<int[]> move;
        int i, j, distance, k;

        for(i = 0; i < ghosts.length; i++) {
            move = ghosts[i].moveOptions(this);
            distance = cells[ghosts[i].row][ghosts[i].column].distance;
            k = -1;
            for(j = 0; j < move.size(); j++) {
                if(cells[move.get(j)[0]][move.get(j)[1]].distance < distance) {
                    if(!(cells[move.get(j)[0]][move.get(j)[1]].element[0] instanceof Ghost)) {
                        distance = cells[move.get(j)[0]][ move.get(j)[1]].distance;
                        k = j;
                    }
                }
            }
            if(k != -1) {
                //found cell to move
                addHistory(ghosts[i].row, ghosts[i].column, move.get(k)[0], move.get(k)[1], false, i == 0);
                cells[ghosts[i].row][ghosts[i].column].rmvElement();
                cells[move.get(k)[0]][move.get(k)[1]].addElement(ghosts[i]);
                ghosts[i].setPosition(move.get(k)[0], move.get(k)[1]);
                if (actor.row == move.get(k)[0] && actor.column == move.get(k)[1]) {
                    return -1;
                }
            }else{
                //no nearest shell than the current
                addHistory(ghosts[i].row, ghosts[i].column, ghosts[i].row, ghosts[i].column, false, i == 0);
            }
        }
        return 0;
    }

    int jump(int number, String path) {
        int[] position;
        int i;
        String positionStr;

        obj2 = obj1;//keep old history
        if((number%2 != 0 && ghosts.length != 0) || !obj2.has(String.valueOf(number))) {
            return -1;
        }
        try{
            String contents = new String(Files.readAllBytes(Paths.get(path)));
            JSONObject obj = new JSONObject(contents);
            initBoard(obj);
        }catch (IOException _) {
        }
        for(i = 0; i < number; ) {
            positionStr = (String) obj2.get(String.valueOf(i));
            position = getCoordinates(positionStr, true);
            moveActor(position[0], position[1]);
            if(ghosts.length != 0) {
                i += 2;
            }else{
                i++;
            }
        }
        return 1;
    }

    public static final String ANSI_RED = "\u001B[31m";
    public static final String ANSI_GREEN = "\u001B[32m";
    public static final String ANSI_YELLOW = "\u001B[33m";
    public static final String ANSI_BLUE = "\u001B[34m";
    public static final String ANSI_RESET = "\u001B[0m";
}
