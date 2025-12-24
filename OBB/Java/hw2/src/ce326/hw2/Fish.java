package ce326.hw2;

public class Fish extends BoardElement implements Eatable{
    int energy = 10;
    public int eaten(){
        return this.energy;
    }
}
