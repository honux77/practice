import java.util.Random;

public class Turtle implements MoveStrategy {

    private Random r = new Random();

    @Override
    //turtle goes +1 about 95% probability
    public int forward() {
        int p = r.nextInt(100);
        if (p < 95) {
            return 1;
        } else {
            return 0;
        }
    }

    public static void main(String[] args) {
        Turtle leo = new Turtle();
        int count = 0;
        for(int i = 0; i < 100000; i++) {
            if (leo.forward() == 0) {
                count++;
            }
        }
        System.out.println(count);
    }
}
