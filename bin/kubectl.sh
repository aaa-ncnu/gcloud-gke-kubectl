#!/usr/bin/env bash

echo ${PLUGIN_KEYFILE} > /keyfile.json

set -a

if [ -f "${PWD}/${PLUGIN_ADDTL_ENV_VARS}" ]; then
  source ${PWD}/${PLUGIN_ADDTL_ENV_VARS}
  echo "Imported additional environment variables from ${PWD}/${PLUGIN_ADDTL_ENV_VARS}"
fi

gcloud auth activate-service-account --key-file=/keyfile.json --project=${PLUGIN_PROJECT}
gcloud container clusters get-credentials ${PLUGIN_CLUSTER} --zone ${PLUGIN_ZONE} --project ${PLUGIN_PROJECT}

python /run_commands.py
