#!/usr/bin/python
from datetime import datetime
import boto3

def findInstanceByTag(tag):
    ret=[]
    instances = boto3.resource('ec2').instances.all()
    for instance in instances:
        if instance.tags is None:
            ret.append(instance.id)
            continue
        nametag = (item for item in instance.tags if item['Key'] == 'Name').next()
        name = nametag['Value']
        state = instance.state['Name']
        if tag in name:
            if state == 'running':
                ret.append(instance.id)
            else:
                print name, "is not running"
    return ret

def stopInstances(ids):
    for ec2id in ids:
        instance = ec2.Instance(ec2id)
        ret = instance.stop()
        print ret
    
now = str(datetime.now())
tags = ["cocoa", "temp"]
log = "[" + now + "] Stopping instances: " + str(tags)
print log
ec2 = boto3.resource('ec2')
for tag in tags:
    ids = findInstanceByTag(tag)
    if len(ids) !=0:
        stopInstances(ids)
    else:
        print "Can't find", tag, "instances to stop."
