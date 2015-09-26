import java.util.Random;

public class InsertionSort {

	public void insertionSort(int[] arr) {
	}


	public static void print(int[] arr, String title) {
		String str="";
		System.out.println(title);
		for(int i = 0; i < arr.length; i++) {
			System.out.println("a[" + i + "] " + arr[i]);
		}
	}

	public static int[] genArray(int len, boolean random) {
		Random r = new Random();
		int[] array = new int[len];
		for (int i = 0; i < len; i++) {
			array[i] = random ? r.nextInt(len * 2) : i;
		}
		return array;
	}

	public static void qsort() {
		System.out.println("Hello: ");
	}

	public static void main(String[] args) {
		int[] input = genArray(10, true);
		print(input, "Before");
		insertionSort(input);
		print(input, "After");
	}
}
