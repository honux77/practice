import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

//import org.junit.jupiter.api.*;
import static org.assertj.core.api.Assertions.*;

class TurtleTest {

    private Turtle turtle;

    @BeforeEach
    void setUp() {
        System.out.printf("new Turtle");
        turtle = new Turtle();
    }

    @Test
    void forward() {
        assertThat(turtle.forward()).isEqualTo(1);
    }

    @Test
    void stop() {
        assertThat(turtle.forward()).isEqualTo(0);
    }
}