package honux;

public abstract class People {
	public int age;
	public String name;
	public double weight;
	public People() {
		weight = 60;
		age = 20;
		name = "Jhon Doe";
	}
	public abstract void walk();
}
