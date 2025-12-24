package ce326.hw2;

public class Meat extends BoardElement implements Eatable{
    int energy = 14;
    public int eaten(){
        return this.energy;
    }
}
