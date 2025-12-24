package ce326.hw2;

public class Vegetable extends BoardElement implements Eatable{
    int energy = 6;
    public int eaten(){
        return this.energy;
    }
}
