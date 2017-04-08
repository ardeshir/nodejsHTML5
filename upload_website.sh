#!/usr/bin/env bash

function usage {
     echo """

     upload_website.sh <s3_bucket_name>

     ex:
     upload_website.sh website
     """
 }

S3_BUCKET=''

 # Get the table name
 if [ $# -eq 0 ]; then
     usage;
     exit;
 else
     S3_BUCKET="$1"
 fi

aws s3 cp ./website/ "s3://$S3_BUCKET" --recursive --exclude "*.yaml"
