# Boto 3
import boto3
regionList=[]
ec2regions = boto3.client('ec2').describe_regions(); #dict
for region in ec2regions['Regions']: #list
    regionList.append(region['RegionName'])

def printEc2RunningList(regionName):
    print("Region:", regionName)
    ec2 = boto3.resource('ec2', regionName)
    instances = ec2.instances.all();
    for instance in instances:
        print(instance.id, instance.instance_type, instance.state, instance.tags)
"""
    instances = ec2.instances.filter(
        Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])
"""

# Use the filter() method of the instances collection to retrieve
# all running EC2 instances.
for regionName in regionList:
    printEc2RunningList(regionName)
