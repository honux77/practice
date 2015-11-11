package hoyoung.awskr;

import java.util.List;

import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.Bucket;

public class BasicS3 {
    private static Region region = Region.getRegion(Regions.AP_NORTHEAST_1);
    
    public static void printBucketList() {
    	AmazonS3Client s3 = new AmazonS3Client();
		s3.setRegion(region);
		List<Bucket> buckets = s3.listBuckets();
		for (Bucket b: buckets) {
			System.out.println(b.getName());
		}
    }

	public static void main(String[] args) {
		System.out.println("Hello, AWS");
		printBucketList();
		
	}

}
