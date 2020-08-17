#!/usr/bin/env sh

aws-nuke $@

if [ ! -z "$RECREATE_DEFAULT_VPC_RESOURCES" ]
then
  is_dry_run=`echo "$@" |grep '\-\-no\-dry\-run'`
  
  if [ ! -z "$is_dry_run" ]
  then
    echo "RECREATE_DEFAULT_VPC_RESOURCES is set. This will create the default VPC, subnets, internet gateway, DHCP options and security groups after runnig aws-nuke."
    create_aws_default_resources
  else
    echo "Skiping default VPC, subnets, internet gateway, DHCP options and security groups recreation in dry mode"
  fi
fi
