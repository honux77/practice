import boto3
regionList=['ap-northeast-2']

def findTag(instance, key, value):
    tags = instance.tags
    target_tag = ""
    if tags is None:
        print("No tags")
        return True
    # find tag value of key
    for tag in tags:
        if tag['Key'] == key: 
            target_tag = tag['Value']
            break
    if target_tag in value:
        print("{}: {}".format(key, target_tag))
        return True
    return False

def startInstances(tag, value, region):
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
            print("start {}".format(instance.instance_id))
            instance.start()

startInstances('Environment', 'dev', 'ap-northeast-2')
