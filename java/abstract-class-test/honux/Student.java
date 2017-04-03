package honux;

public class Student extends People {
	public int score;
	public int money;
	
	public void study(int hour) {
		super.weight += 1 * hour;
		score++;
	}

	

	@Override
	public void walk() {
		// TODO Auto-generated method stub
		
	}

	/*
	@Override
	public void walk() {
		super.weight -= 1;
	}
	*/
}
