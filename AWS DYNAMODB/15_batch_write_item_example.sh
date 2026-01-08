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

# BatchWriteItem example (watch for UnprocessedItems in the response)
aws dynamodb batch-write-item --region "$REGION" "${profile_arg[@]}" \
  --request-items "{\"$TABLE\":[{\"PutRequest\":{\"Item\":{\"PK\":{\"S\":\"user#999\"},\"SK\":{\"S\":\"profile\"},\"name\":{\"S\":\"Test\"}}}}]}"
