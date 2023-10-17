#!/bin/bash
#https://gist.github.com/priyankapatil250696
set -euxo pipefail

#BACKUP_GITHUB_OWNER="
#BACKUP_GITHUB-PAT="
#BACKUP_BUCKET_NAME="
#BACKUP_AWS_REGION="
#SECRETS.BACKUP_AWS_ROLE="


echo " Logging in with personal access token."
export GH_TOKEN=$BACKUP_GITHUB_PAT
gh auth setup-git

echo "Downloading repositories...."
find . -maxdepth 1 -type d

echo "Uploading to S3 buket" $BACKUP_BUCKET_NAME " in region" $BACKUP_AWS_REGION
aws s3 sync --region=$BACKUP_AWS_REGION .s3://$BACKUP_BUCKET_NAME/github.com/$BACKUP_GITHUB_OWNER/ 'date"+%Y-%m-%d"'/

echo "complete."
