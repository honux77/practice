public class ArrayTest {
	public static void main(String[] args) {
		Object[] obj = new Object[2];
		obj[0] = new int[3];
		obj[1] = new int[2][3];
		((int[]) obj[0])[0] = 5;
		System.out.println(((int[])obj[0])[0]);
	}
}
