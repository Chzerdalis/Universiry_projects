package ce326.hw2;
import java.util.ArrayList;
import java.util.List;

public class Actor extends BoardElement implements Movable{
    int energy;

    public List<int[]> moveOptions(Board board) {
        List<int[]> moves = new ArrayList<>();
        int[] row = new int[] {0,-1,-1,-1,0,1,1,1};
        int[] col = new int[] {-1,-1,0,1,1,1,0,-1};

        for(int i = 0; i < 8; i++) {
            row[i] = row[i] + this.row;
            col[i] = col[i] + this.column;

            if(row[i] == -1) {row[i] = board.numRows - 1;}
            else if(row[i] == board.numRows) {row[i] = 0;}
            if(col[i] == -1) {col[i] = board.numCols - 1;}
            else if(col[i] == board.numCols) {col[i] = 0;}

            if(board.cells[row[i]][col[i]].element[0] == null || !(board.cells[row[i]][col[i]].element[0] instanceof Obstacle)) {
                moves.add(new int[]{row[i], col[i]});
            }
        }
        return moves;
    }
}
