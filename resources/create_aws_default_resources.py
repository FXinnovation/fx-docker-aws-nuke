#!/usr/bin/env python3

import boto3
from botocore.exceptions import ClientError
from botocore.exceptions import ParamValidationError

ec2 = boto3.client('ec2')
for region in ec2.describe_regions()['Regions']:
  client = boto3.client('ec2', region_name = region['RegionName'])

  try:
    print("\nCreate defaut VPC in " + region['RegionName'])
    client.create_default_vpc()
    print("-> Created")
  except ClientError as error:
    if error.response['Error']['Code'] == 'InternalError':
      print('-> Error Message: {}'.format(error.response['Error']['Message']))
      print('-> Request ID: {}'.format(error.response['ResponseMetadata']['RequestId']))
      print('-> Http code: {}'.format(error.response['ResponseMetadata']['HTTPStatusCode']))
    elif error.response['Error']['Code'] == 'LimitExceededException':
      print("-> Error: Limit exceed for VPC in region" + region['RegionName'])
      print('-> Request ID: {}'.format(error.response['ResponseMetadata']['RequestId']))
      print('-> Http code: {}'.format(error.response['ResponseMetadata']['HTTPStatusCode']))
    elif error.response['Error']['Code'] == 'DefaultVpcAlreadyExists':
      print("-> Default VPC in " + region['RegionName'] + " already exist. Skip.")
    else:
      print("-> Error: " + error.response['Error']['Code'] + " (" + error.response['Error']['Message'] + ")")
      print('-> Request ID: {}'.format(error.response['ResponseMetadata']['RequestId']))
      print('-> Http code: {}'.format(error.response['ResponseMetadata']['HTTPStatusCode']))
    pass
  except ParamValidationError as error:
    print('Unvalid parameters provided: {}'.format(error))
    pass
