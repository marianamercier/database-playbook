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

# UpdateItem with optimistic-style condition
aws dynamodb update-item --region "$REGION" --table-name "$TABLE" "${profile_arg[@]}" \
  --key '{"PK":{"S":"user#123"},"SK":{"S":"profile"}}' \
  --update-expression "SET version = if_not_exists(version, :zero) + :one" \
  --condition-expression "attribute_exists(PK)" \
  --expression-attribute-values '{":zero":{"N":"0"},":one":{"N":"1"}}' \
  --return-values ALL_NEW
