#!/bin/bash
#
# 8/17/16
# Description: Using an existing AWS profile from .aws/credentials, kill a list of instances in an AWS region.
# Notes:
#   * Can get list of instances from aws ec2 describe-instances --output text | awk


REGION=sa-east-1
IDS=(i-72d116f0 i-73d116f1 i-71d116f3 i-74d116f6 i-75d116f7 i-2ed017ac i-2fd017ad i-2cd017ae i-2dd017af i-32d017b0)

for id in $IDS; do
        aws --profile personal --region $REGION ec2 modify-instance-attribute --no-disable-api-termination --instance-id $id
        aws --profile personal --region $REGION ec2 terminate-instances --instance-ids $id
done
