#!/usr/bin/env bash 

if [ -f ~/.ec2 ]; then
	instance=`cat ~/.ec2`
fi

ec2 () {
	# $1: instance_id
	aws ec2 describe-instances --instance-ids $1 --query "Reservations[*].Instances[*][Tags[?Key=='Name'].Value | [0],InstanceId,PublicIpAddress,State.Name]" --output text 
}

ec2 $instance

echo '+---------------------+'
echo '| 1. start instance   |'
echo '| 2. stop instance    |'
echo '| 3. change instance  |'
echo '+---------------------+'
printf "choose (1-3, enter=exit): "
read choice

if [[ $choice == "" ]];then
	echo Bye! 
	exit 0
fi

if [ $choice -eq 1 ];then
	echo "Start instance $instance"
	aws ec2 start-instances --instance-ids $instance --output=table
	echo "Wait for running..."
	aws ec2 wait instance-running --instance-id $instance
	echo "Now $instance is ready!"  
	ec2 $instance
elif [ $choice -eq 2 ]; then
	echo "stop instance $instance"
	aws ec2 stop-instances --instance-ids $instance --output=table
	aws ec2 wait instance-stopped --instance-id $instance
	echo "Now $instance is stopped!"  
	ec2 $instance
elif [ $choice -eq 3 ]; then
	if [ -f ~/.ec2 ]; then
		rm ~/.ec2
	fi
	ec2 
	echo "Input new ec2 instance-id"
	read EID
	echo $EID > ~/.ec2
else 
	echo "Bye."
fi
