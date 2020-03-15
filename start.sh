#!/bin/sh
/root/.local/bin/aws s3 cp s3://$MINECRAFT_S3_BUCKET/data /data --recursive
chown -R 1000:1000 /data
nohup /backup-data-to-s3.sh > /data/backup.log 2>&1 &
/start
