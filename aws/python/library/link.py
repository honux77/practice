#simple python api for ec2 instance
import boto3

class link(object):
    regionList = None
    region = None
    def initRegionList(self):
        if not self.regionList:
            self.regionList=[]
            ec2regions = boto3.client('ec2').describe_regions(); #dict
            for region in ec2regions['Regions']: #list
                self.regionList.append(region['RegionName'])

    def __init__(self, region = 'ap-northeast-1'):
        self.initRegionList()
        self.changeRegion(region)

    def changeRegion(self,region):
        DEFAULT_REGION = 'ap-northeast-1'
        if region in self.regionList:
            self.region = region
        else:
            self.region = DEFAULT_REGION
        self.ec2 = boto3.resource('ec2')

    def getAllEC2Instances():
        return self.ec2.instances.all()

    def getInstanceById(id):
        return boto3.resource('ec2').Instance(id)

    def findInstancesByTag(tag):
        instances = getAllEC2Instances
        for instance in instances:
            name = __findNameTag(instance)
            print(name)

    def termitateAllInstancesByTag(tag = "temp",region = "all"):
        return None

    #private method?
    def __findNameTag(instance):
        tags = instance.tags
        if tags is None:
            return None
        tag = (item for item in tags if tag['Key'] == 'Name').next()
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

def main():
    me = link()
    print('regions:', me.regionList)
    print(me.region)
    me.changeRegion('ap-south-east1') #error, not changed
    print('regions:', me.regionList)
    print(me.region)
    me.changeRegion('ap-southeast-1') #ok
    print('regions:', me.regionList)
    print(me.region)

if __name__ == '__main__':
    main()
