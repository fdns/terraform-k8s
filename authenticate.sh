#!/usr/bin/env bash
set -e
trap 'echo "Error authenticating";set +e' ERR

read AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN <<< \
$(aws sts get-session-token --serial-number arn:aws:iam::345025288683:mfa/$1 --token-code $2 --output text | awk '{ print $2, $4, $5 }')

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN

set +e
