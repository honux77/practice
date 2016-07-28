#!/bin/zsh
ROLE_ARN="arn:aws:iam:123456789012:role/myrole"
ROLE_SESSION="some-session-name"

RET=`aws sts assume-role --role-arn $ROLE_ARN --role-session-name $ROLE_SESSION --query Credentials --output text`

# if bash --> export AWS_ACCESS_KEY_ID=`echo $RET | cut -d ' ' -f 1`
export AWS_ACCESS_KEY_ID=`echo $RET | cut -f 1`
export AWS_SECRET_ACCESS_KEY=`echo $RET | cut -f 3`
export AWS_SESSION_TOKEN=`echo $RET | cut -f 4`
