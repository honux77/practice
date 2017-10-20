#!/bin/bash

if [[ $1 == "change" ]]; then
	cat ~/.ec2;rm ~/.ec2
fi

if [ -f ~/.ec2 ]; then
	EID=`cat ~/.ec2`
else
	echo "Input ec2 instance id"
	read EID
	echo $EID > ~/.ec2
fi

echo INSTANCE ID=$EID

if [[ $1 == "start" ]]; then
	aws ec2 start-instances --instance-ids $EID --output text
	aws ec2 wait instance-running --instance-ids $EID 
	aws ec2 describe-instances --instance-ids $EID --query "Reservations[*].Instances[*].[InstanceId,Tags[0].Value,PublicIpAddress]" --output text
elif [[ $1 == "stop" ]]; then
	aws ec2 stop-instances --instance-ids $EID --output text
else
	aws ec2 describe-instances --instance-ids $EID --query "Reservations[*].Instances[*].[InstanceId,Tags[0].Value,PublicIpAddress]" --output text
fi
