# aws-nuke
## Description
This image contains `aws-nuke` and a custom python script that automaticly recreate default resource on demande (Default VPC). The image is based on the official alpine image. It should be more lightweight this way.

## Tags
We push a `latest` tag on this repository, to run an older version please checkout the different tags.
We do not follow the cloud-nuke release tags in the docker image tags. You can always find the cloud-nuke version in the Dockerfile that was used to create the image or you can use the labels.

## Usage
For aws-nuke help, you can run this command 

`docker run --rm -v $(pwd):/data fxinnovation/aws-nuke --help`

If `CREATE_DEFAULT_VPC` environment variable isset, this will recreate all default resources on all regions.

`docker run -it --rm -v ${pwd}/config.yaml:/data/config.yaml -e AWS_ACCESS_KEY_ID=<access_key> -e AWS_SECRET_ACCESS_KEY=<secret_key> -e CREATE_DEFAULT_VPC=true -e AWS_DEFAULT_REGION=ca-central-1 fxinnovation/aws-nuke -c /data/config.yaml --force --no-dry-run`


NOTE: 
You can use both aws profile or aws environment variable to pass credentials 

`docker run -it --rm -v ${pwd}/config.yaml:/data/config.yaml -v /home/user/.aws/credentials:/root/.aws/credentials -e CREATE_DEFAULT_VPC=true fxinnovation/aws-nuke -c /data/config.yaml --force --no-dry-run`

For more information about aws-nuke configuration file, see [offical repository on github](https://github.com/rebuy-de/aws-nuke)

## Labels
We set labels on our images with additional information on the image. we follow the guidelines defined at http://label-schema.org/. Visit their website for more information about those labels.

## Comments & Issues
If you have comments or detect an issue, please be advised we don't check the docker hub comments. You can always contact us through the repository.

## Contributions
Contributions are welcome.
