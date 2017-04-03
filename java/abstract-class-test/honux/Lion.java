package honux;

public class Lion  <T>{
	public Lion(double weight) {
		this.weight = weight;
	}
	public double weight;
	public void eat(T t) {
		if (t instanceof Student ) {
			weight += ((Student) t).weight / 10;
			System.out.println("I like human and my weight is now " + weight);

		}
		else {
			System.out.println("I don't like " + t.getClass().getName());
		}
	}
}
