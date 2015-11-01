aws ec2 run-instances --image-id ami-xxxxxxxx --count 1 --instance-type t1.micro --key-name MyKeyPair \
--security-group-ids sg-xxxxxxxx --subnet-id subnet-xxxxxxxx
