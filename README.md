# minecraft-server-aws

This project is an extentsion of the itzg/minecraft-server:latest minecraft Docker project to allow it to be run in AWS ECS on Fargate/EC2 with a backkup to S3.

## Prerequisites

ECS Cluster

ECR repo

S3 Bucket

ecsTaskExecutionRole IAM role defined with S3 read/write access

## Checkout

```
get clone git@github.com:bobpaulin/minecraft-server-aws.git
```

## Build 

```
cd minecraft-server-aws
docker build -t minecraft-server-aws .
```

## Push to ECR

```
docker login <some account>.dkr.ecr.<region>.amazonaws.com/minecraft-aws
docker tag minecraft-server-aws:latest <some account>.dkr.ecr.<region>.amazonaws.com/minecraft-aws:latest
docker push <some account>.dkr.ecr.<region>.amazonaws.com/minecraft-aws:latest
```

## Start an ECS Task or service

I use 4 VCPU with 8 GB of memory since I run mods (smaller at your own risk) .

### Ports

Open the following ports

25565	25565	tcp

25565	25565	udp

### Env Vars

Also define an MINECRAFT_S3_BUCKET environment variable to backup world data to the bucket

ex MINECRAFT_S3_BUCKET=minecraft-data  and data will backup to s3://minecraft-data/data every 5 mins

All the Env variables at https://hub.docker.com/r/itzg/minecraft-server/  are available.  (make sure to set EULA=TRUE)

Also for mods (like pixelmon)

EULA	TRUE

FORGEVERSION	14.23.5.2838

MEMORY	4g

MINECRAFT_S3_BUCKET	minecraft-forge-bob

TYPE	FORGE

VERSION	1.12.2

## Mods

The add the mods to your S3 bucket at /data/mods


