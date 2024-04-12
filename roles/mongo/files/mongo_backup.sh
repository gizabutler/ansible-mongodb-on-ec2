#!/bin/bash


MONGODUMP_PATH="/usr/bin/mongodump"
BACKUP_PASSWORD="prayformongo"
MONGO_DATABASE="admin" #replace with your database name

TIMESTAMP=`date +%F-%H%M`
S3_BUCKET_NAME="tasky-backup" #replace with your bucket name on Amazon S3
S3_BUCKET_PATH="mongodb-backups"

# Create backup
(echo $BACKUP_PASSWORD) \
  | mongodump --host localhost --port 27017 -u backup --gzip
# $MONGODUMP_PATH -u backup -p prayformongo --gzip
# echo "$MONGODUMP_PATH -d $MONGO_DATABASE"

# Add timestamp to backup
mv dump mongodb-$HOSTNAME-$TIMESTAMP
tar cf mongodb-$HOSTNAME-$TIMESTAMP.tar mongodb-$HOSTNAME-$TIMESTAMP

# Upload to S3
#s3cmd put mongodb-$HOSTNAME-$TIMESTAMP.tar s3://$S3_BUCKET_NAME/$S3_BUCKET_PATH/mongodb-$HOSTNAME-$TIMESTAMP.tar
aws s3 cp mongodb-tasky-$TIMESTAMP.tar s3://$S3_BUCKET_NAME/$S3_BUCKET_PATH/mongodb-tasky-$TIMESTAMP.tar

#Delete local files
#rm -rf mongodb-*
