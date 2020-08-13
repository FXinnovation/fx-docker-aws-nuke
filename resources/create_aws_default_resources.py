#!/usr/bin/env python3

import boto3
from botocore.exceptions import ClientError

ec2 = boto3.client('ec2')
for region in ec2.describe_regions()['Regions']:
  client = boto3.client('ec2', region_name = region['RegionName'])

  try:
    print("Create defaut VPC in " + region['RegionName'])
    client.create_default_vpc()
  except ClientError as error:
    print("Error: " + error.response['Error']['Code'] + "(" + error.response['Error']['Message'] + ")")
    pass
  except:
    print("Unknown error")
    pass
