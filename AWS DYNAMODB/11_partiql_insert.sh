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

# PartiQL INSERT / UPSERT
aws dynamodb execute-statement --region "$REGION" "${profile_arg[@]}" \
  --statement 'INSERT INTO "'"$TABLE"'" VALUE {"PK":"user#123","SK":"profile","name":"Mariana","updatedAt":?}' \
  --parameters '[{"S":"2026-01-08T00:00:00Z"}]'
