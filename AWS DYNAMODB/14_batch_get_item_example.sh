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

# BatchGetItem example
aws dynamodb batch-get-item --region "$REGION" "${profile_arg[@]}" \
  --request-items "{\"$TABLE\":{\"Keys\":[{\"PK\":{\"S\":\"user#123\"},\"SK\":{\"S\":\"profile\"}},{\"PK\":{\"S\":\"user#456\"},\"SK\":{\"S\":\"profile\"}}]}}"
