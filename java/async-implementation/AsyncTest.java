
public class AsyncTest {
	public static boolean loop = true;

	public static void main(String[] args) throws InterruptedException {
		FileReaderThread.read("test.txt", 
				result -> {
					System.out.println(result);
					AsyncTest.loop = false;
					System.out.println("Job finished successfully.");
				}, 
				error -> {
					System.out.println(error);
					AsyncTest.loop = false;
					System.out.println("Job finished with error.");
				});

		int count = 0;
		while (loop) {
			Thread.sleep(1);
			count++;
			if (!loop) {
				break;
			}
		}

		System.out.printf("after %d ms, Program ended\n", count);

	}
}
