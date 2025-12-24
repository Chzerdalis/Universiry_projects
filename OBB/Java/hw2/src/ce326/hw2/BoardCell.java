package ce326.hw2;

public class BoardCell {
    boolean empty;
    boolean surpassed;
    BoardElement[] element = new BoardElement[2];
    int distance;

    BoardCell() {
        this.element[0] = null;
        this.element[1] = null;
        empty = true;
        surpassed = false;
    }

    void addElement(BoardElement element) {
        if(this.element[0] == null) {
            this.element[0] = element;
        }else {
            this.element[1] = this.element[0];
            this.element[0] = element;
        }
        empty = false;
    }

    void rmvElement() {
        this.element[0] = this.element[1];
        this.element[1] = null;
        if(this.element[0] == null) {empty = true;}
    }
}


