#!/usr/bin/env bash

echo ${PLUGIN_KEYFILE} > /keyfile.json

gcloud auth activate-service-account --key-file=/keyfile.json --project=${PLUGIN_PROJECT}
gcloud container clusters get-credentials ${PLUGIN_CLUSTER} --zone ${PLUGIN_ZONE} --project ${PLUGIN_PROJECT}

python /run_commands.py
