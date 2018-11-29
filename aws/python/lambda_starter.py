import boto3
import os

def lambda_handler(event, context):
    k = os.environ['key']
    v = os.environ['value']
    return stopInstances('ap-northeast-2', k, v)

regionList=['ap-northeast-2']

def findTag(instance, key, value):
    tags = instance.tags
    if tags is None:
        return False        
    tag_value = next((t['Value'] for t in tags if t['Key'] == key), None)
    return tag_value == value 

def stopInstances(region, tag, value):
    targets = []
    print("region:", region)
    ec2 = boto3.resource('ec2', region)
    instances = ec2.instances.all()
    for instance in instances:
        if findTag(instance, tag, value): 
            targets.append(instance)

    if len(targets) == 0:
        print("Target instance not found.")
    else:
        for instance in targets:
            print("Start {}".format(instance.instance_id))
            instance.start()
    return len(targets)