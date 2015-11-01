import boto3
region = 'ap-northeast-1'
KILLTAG = 'temp'
ec2 = boto3.resource('ec2', region)
instances = ec2.instances.all()
for instance in instances:
    # print(instance.id, instance.instance_type, instance.state, instance.tags)
    tags = instance.tags
    state = instance.state['Name']
    found = False
    name = (item for item in tags if item['Key'] == 'Name').next()
    if KILLTAG in name:
        found = True
        print(name, instance.id, state)
        # try to kill
        ret =instance.terminate()
        print(ret)
if not found:
    print("Target instance not found.")
