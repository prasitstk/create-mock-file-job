#!/bin/bash

# NOTE: Also required to set the following environment variables in addition to what we use below:
# - AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID>
# - AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
# - AWS_REGION=<AWS_REGION>

# Create /home/ec2-user/mainte/ikemen-ouji-api/db_mainte.json
echo $(date -u '+%Y-%m-%d %H:%M:%S') - Start send-command to create a mock file...
aws ssm send-command \
    --document-name "create-mock-file" \
    --parameters "mockContent='${MOCK_CONTENT:-Mock Content}'" \
    --targets Key=resource-groups:Name,Values="$RESOURCE_GRP_NAME" \
    --document-version '$DEFAULT'
echo $(date -u '+%Y-%m-%d %H:%M:%S') - Finish send-command to create a mock file.
