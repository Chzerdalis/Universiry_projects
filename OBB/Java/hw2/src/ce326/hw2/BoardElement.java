package ce326.hw2;

public abstract class BoardElement {
    protected int row;
    protected int column;

    void setPosition(int row, int column) {
        this.row = row;
        this.column = column;
    }
}
