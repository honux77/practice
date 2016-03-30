import boto3
from botocore.exceptions import NoCredentialsError, ClientError
import sys

def getAllBuckets():
    try:
        s3 = boto3.resource('s3')
        buckets = s3.buckets.all()
        bucketList = list(buckets)
        num_buckets = len(bucketList)
        print "Number of Buckets: ", num_buckets
        for bucket in bucketList:
            print bucket.name

    except NoCredentialsError as nex:
        print "Error: InvalidCredentials", nex
        sys.exit()

    except ClientError as cex:
        print ex
        return 0

getAllBuckets()
