# various ec2 script example

# launch ec2 instances (amazon linux)
# Amazon linux ap-northeast-1 : ami-383c1956
LINUX_AMI=ami-383c1956
KEYPAIR=MyKey
aws ec2 run-instances --image-id $LINUX_AMI --count 1 --instance-type t2.micro --key-name $KEYPAIR \
--security-group-ids sg-xxxxxxxx --subnet-id subnet-xxxxxxxx


# find instance by tag name
aws ec2 describe-instances --filter 'Name=tag:Name,Values=watple' --query Reservations[0].Instances[0].InstanceId
