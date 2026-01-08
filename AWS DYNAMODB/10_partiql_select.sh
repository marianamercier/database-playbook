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

# PartiQL SELECT (good for demos/troubleshooting)
aws dynamodb execute-statement --region "$REGION" "${profile_arg[@]}" \
  --statement 'SELECT * FROM "'"$TABLE"'" WHERE PK=? AND SK=?' \
  --parameters '[{"S":"user#123"},{"S":"profile"}]'
