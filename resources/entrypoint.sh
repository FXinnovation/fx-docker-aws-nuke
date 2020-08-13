#!/usr/bin/env sh

if [ ! -z "$CREATE_DEFAULT_VPC" ]
then
  echo "CREATE_DEFAULT_VPC is set. This will create the default VPC after runnig aws-nuke."
  
  aws-nuke $@
  
  isdryrun=`echo "$@" |grep '\-\-no\-dry\-run'`
  
  if [ ! -z "$isdryrun" ]
  then
    create_aws_default_resources
  else
    echo "Skiping default VPC recreation in dry mode"
  fi
else
  aws-nuke $@
fi
