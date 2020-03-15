#!/bin/sh
while true
do
  /root/.local/bin/aws s3 sync /data s3://$MINECRAFT_S3_BUCKET/data
  sleep 300
done
