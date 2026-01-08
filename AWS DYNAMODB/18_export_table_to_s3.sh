#!/usr/bin/env bash
set -euo pipefail

# DynamoDB Playbook - command script
# Required env vars:
#   REGION (e.g., us-east-1)
#   TABLE  (DynamoDB table name)
# Optional:
#   PROFILE (AWS CLI profile name)
#
# Usage:
#   REGION=us-east-1 TABLE=my_table ./this_script.sh
#
# If PROFILE is set, scripts will use: --profile "$PROFILE"
profile_arg=()
if [[ -n "${PROFILE:-}" ]]; then
  profile_arg=(--profile "$PROFILE")
fi

# Requires TABLE_ARN and target S3 bucket/prefix.
: "${TABLE_ARN:?Set TABLE_ARN}"
: "${S3_BUCKET:?Set S3_BUCKET}"
: "${S3_PREFIX:?Set S3_PREFIX}"

aws dynamodb export-table-to-point-in-time --region "$REGION" "${profile_arg[@]}" \
  --table-arn "$TABLE_ARN" \
  --s3-bucket "$S3_BUCKET" \
  --s3-prefix "$S3_PREFIX" \
  --export-format DYNAMODB_JSON
