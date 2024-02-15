#!/bin/bash

staged=$(/usr/bin/bootc status --json | jq '.status.staged')

# Proceed only if there's a staged update
if [[ "$staged" != "null" && "$staged" != "" ]]; then
    incompatible=$(jq -n --argjson staged "$staged" '$staged.incompatible')

  # Check if the staged update is compatible
  if [[ "$incompatible" == "false" ]]; then
      # Indicate a compatible staged update is ready to kured for reboot
      touch /var/run/reboot-required
  fi
fi
