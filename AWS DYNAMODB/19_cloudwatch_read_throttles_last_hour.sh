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

# ReadThrottleEvents over the last 60 minutes
start_time="$(date -u -d '60 minutes ago' +%FT%TZ)"
end_time="$(date -u +%FT%TZ)"

aws cloudwatch get-metric-statistics --region "$REGION" "${profile_arg[@]}" \
  --namespace AWS/DynamoDB \
  --metric-name ReadThrottleEvents \
  --dimensions Name=TableName,Value="$TABLE" \
  --statistics Sum \
  --start-time "$start_time" \
  --end-time "$end_time" \
  --period 60
