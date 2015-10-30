# Boto 3
import boto3
regionList=[]
ec2regions = boto3.client('ec2').describe_regions(); #dict
for region in ec2regions['Regions']: #list
    regionList.append(region['RegionName'])


def findNameTag(tags):
    for tag in tags:
        if tag['Key'] == 'Name':
            name = tag['Value']
    return name

def terminateEC2Instances(tag, regionName):
    print("Region:", regionName)
    found = False
    KILLTAG = tag
    ec2 = boto3.resource('ec2', regionName)
    instances = ec2.instances.all()
    for instance in instances:
        name = findNameTag(instance.tags)
        state = instance.state['Name']
        if KILLTAG in name:
            found = True
            print(name, instance.id, state)
            # try to kill
            if not('terminated' == state or 'shutting-down' == state):
                ret =instance.terminate()
                print(ret)
    if not found:
        print("Target instance not found.")
    return found

def printEc2RunningList(regionName, isAll):
    print("Region:", regionName)
    found = False;
    ec2 = boto3.resource('ec2', regionName)
    if isAll:
        instances = ec2.instances.all();
    else:
        instances = ec2.instances.filter(
            Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])

    for instance in instances:
        found = True;
        state = instance.state['Name']
        print(instance.id, instance.instance_type, state, instance.tags)

    if not found:
        print("No Instances.")

# Use the filter() method of the instances collection to retrieve
# all running EC2 instances.
for regionName in regionList:
    printEc2RunningList(regionName,False)
    # terminateEC2Instances('temp', regionName)
