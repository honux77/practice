#simple python api for Ec2 instance
import boto3

'''
Link - Easy Ec2 library
Member
+ region

Public method
chageRegion(region) -- test ok
getAllEc2Instances() -- test ok
printAllRunningEc2(isRunning) --
printRunningEc2(isRunning) -- test ok
printEc2InfoById(eid) -- test ok
getInstanceById(eid) -- test ok

Private method

'''

class link(object):
    regionList = None
    region = None
    Ec2 = None
    def initRegionList(self):
        if not self.regionList:
            self.regionList=[]
            Ec2regions = boto3.client('ec2').describe_regions(); #dict
            for region in Ec2regions['Regions']: #list
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
        self.Ec2 = boto3.resource('ec2', self.region)

    def getAllEc2Instances(self):
        return self.Ec2.instances.all()

    def printEc2Info(self,Ec2id):
        instance = self.getInstanceById(Ec2id)
        print("  +",instance.id, instance.state['Name'], instance.tags)

    def getInstanceById(self,id):
        return self.Ec2.Instance(id)

    def findInstancesByTag(tag):
        instances = getAllEc2Instances()
        results = []
        for instance in instances:
            name = __findNameTag(instance)
            print(name)
            if tag in name:
                result.add(instance)
        return results

    def termitateAllInstancesByTag(self,tag = "temp"):
        for region in self.regionList:
            terminateEc2Instances(tag, region)

    def printRunningEc2(self, isRunning=True):
        print("Region:", self.region)
        found = False;
        if not isRunning:
            instances = self.Ec2.instances.all();
        else:
            instances = self.Ec2.instances.filter(
                Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])

        for instance in instances:
            found = True
            self.printEc2Info(instance.id)

        if not found:
            print("No Instances.")
            return

    def printAllRunningEc2(self, isRunning = True):
        for region in self.regionList:
            self.changeRegion(region)
            self.printRunningEc2()

    #private method?
    def __findNameTag(instance):
        tags = instance.tags
        if tags is None:
            return None
        tag = (item for item in tags if tag['Key'] == 'Name').next()
        name = tag['Value']
        return name


# terminate instance by single tag
# it also termiate instances which does not have a tag
def terminateEc2Instances(tag, regionName):
    print("terminate instance in Region:", regionName)
    found = False
    KILLTAG = tag
    Ec2 = boto3.resource('Ec2', regionName)
    instances = Ec2.instances.all()
    for instance in instances:
        name = __findNameTag(instance.tags)
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


def test1(link):
    oldregion = link.region
    myregion = 'ap-southeast-1'
    print('\n== Test1: Region List ==')
    print(link.regionList)
    print('current region:', link.region)
    link.changeRegion(myregion)
    newRegion = link.region
    print('after change region: ',newRegion)
    link.changeRegion(oldregion)
    print('after change region: ',link.region)
    if myregion == newRegion:
        print("test 1 ok")
    else:
        print("test 1 fail")

def test2(link):
    print('\n== Test2: print all instances in', link.region)
    instances = link.getAllEc2Instances()
    for instance in instances:
        link.printEc2Info(instance.id)
    print("test2 ok")

def test3(link):
    print("test3 ok")
    link.printRunningEc2(True)
    link.printRunningEc2(False)
    link.changeRegion('ap-southeast-2')
    link.printRunningEc2(False)
    link.changeRegion('ap-northeast-1')
    print("test3 ok")

def test4(link):
    link.printAllRunningEc2()

# test code
def main():
    me = link()
    test1(me)
    test2(me)
    test3(me)
    test4(me)


if __name__ == '__main__':
    main()
