#!/bin/bash

# ami-abcdef01
# kernel is debian specific kernel 3.2, you'll need you own security id group.

AMI=$1
MAX=$2
SEC="sg-012345ef"
KER="aki-31990e0b"
TYP="t1.micro"


if [ "$AMI" == "" ]; then 
  echo "Usage launchinstance.sh ami-id maximum-number-to-launnch"
  exit 1
fi
if [ "$MAX" == "" ]; then
  echo "Usage launchinstance.sh ami-id maximum-number-to-launnch"
  exit 1
fi

aws ec2 run-instances --min-count 1 --image-id $AMI --max-count $MAX --key-name aws_rsa --kernel-id $KER --security-group-ids $SEC --instance-type $TYP

##--placement availability_zone=ap-southeast-2a

