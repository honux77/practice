import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class FileReaderThread implements Runnable {
    private String fileName;

    private Success success;
    private Failure failure;
    
    private FileReaderThread(String fileName, Success success, Failure failure) {
        this.fileName = fileName;
        this.success = success;
        this.failure = failure;
    }
    
    public void run() {
        StringBuffer sb = new StringBuffer();
        try (Scanner s = new Scanner(new File(fileName))){
            while (s.hasNextLine()) {
                sb.append(s.nextLine() + "\n");
            }
            success.onSuccess(sb.toString());
        } catch (FileNotFoundException e) {
            failure.onFailure(e.getMessage());
        }
    }
    
    public static void read(String fileName, Success success, Failure failure) {
        FileReaderThread frt = new FileReaderThread(fileName, success, failure);
        Thread thread = new Thread(frt);
        thread.start();
    }
    
    public interface Success {
        void onSuccess(String result);
    }
    
    public interface Failure {
        void onFailure(String errorMessage);
    }
}
