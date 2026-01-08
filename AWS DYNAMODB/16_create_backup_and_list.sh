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

backup_name="${TABLE}-backup-$(date +%F)"
aws dynamodb create-backup --region "$REGION" --table-name "$TABLE" --backup-name "$backup_name" "${profile_arg[@]}"
aws dynamodb list-backups --region "$REGION" --table-name "$TABLE" "${profile_arg[@]}"
