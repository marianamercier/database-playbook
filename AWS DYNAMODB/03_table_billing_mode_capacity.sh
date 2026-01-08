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

aws dynamodb describe-table --region "$REGION" --table-name "$TABLE" "${profile_arg[@]}" \
  --query "Table.{Mode:BillingModeSummary.BillingMode, RCU:ProvisionedThroughput.ReadCapacityUnits, WCU:ProvisionedThroughput.WriteCapacityUnits, Status:TableStatus}"
