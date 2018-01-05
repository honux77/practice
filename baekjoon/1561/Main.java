import java.io.*;

//Beakjoon 1561 playground 
public class Main {

    public static int findAnswer() throws IOException {
        BufferedReader br = new  BufferedReader(new InputStreamReader(System.in));			
		String[] l1 = br.readLine().split(" ");
		String[] l2 = br.readLine().split(" ");

		long n = new Long(l1[0]);
		int m = new Integer(l1[1]);
		long[] time = new long[m];

		long max = 0;
		for(int i = 0; i < m; i++) {
			time[i] = new Long(l2[i]);
			if (time[i] > max) {
				max = time[i];
			}
		}

		if (n <= m) {
			return (int) n;
		}

		long minTime = 0;
		long maxTime = n * max;

		long numPeople = 0;
		while(minTime < maxTime) {
			long currTime = (minTime + maxTime) / 2;
			numPeople = m;
			for (int i = 0; i < m; i++) {
				numPeople += currTime / time[i];  
			}
			if (numPeople >= n) {
				maxTime = currTime;
			} else if (numPeople < n) {
				minTime = currTime + 1;
			} 
		}	
	    
	    minTime--;	    
		numPeople = m;
		for(int i = 0; i < m; i++) {
			numPeople += minTime / time[i];		
		}
		
	    minTime++;
	    for(int i = 0; i < m; i++) {
	    	if (minTime % time[i] == 0) {
	    		numPeople++;
	    	}
	    	if (numPeople == n) {
	    		return i + 1;
	    	}						
		}		
		return -1;
	}

	public static void main(String[] args) throws IOException {		
		long ans = findAnswer();
		System.out.println(ans);
	}

}
