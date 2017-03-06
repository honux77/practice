import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.List;
import java.util.Stack;

public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader bi = new BufferedReader(new InputStreamReader(System.in));

        Stack<Character> lstack = new Stack <Character>();
        Stack <Character> rstack = new Stack <Character>();

        for (char c: bi.readLine().toCharArray()) {
            lstack.push(c);
        }
        
        int length = Integer.parseInt(bi.readLine());

        for (int i = 0; i < length; i++) {
            String cmd = bi.readLine();
            runCommand(lstack, rstack, cmd);
        }
        printResult(lstack, rstack);
    
    }

    private static void printResult(Stack<Character> lstack, Stack<Character> rstack) {
        StringBuffer sb = new StringBuffer();
        while(!lstack.isEmpty()) 
            rstack.push(lstack.pop());
        while(!rstack.isEmpty())
            sb.append(rstack.pop());
        System.out.println(sb.toString());        
    }

    private static void runCommand(Stack<Character> lstack, Stack<Character> rstack, String cmd) {
        if (cmd.equals("L")) {
            if (!lstack.isEmpty())
                rstack.push(lstack.pop()); } else if (cmd.equals("D")) { if (!rstack.isEmpty()) 
                lstack.push(rstack.pop());
        }
        else if (cmd.equals("B")) {
            if (!lstack.isEmpty())
                lstack.pop();
        }
        else if (cmd.contains("P")) {
            lstack.push(cmd.charAt(2));
        }
    }
}
