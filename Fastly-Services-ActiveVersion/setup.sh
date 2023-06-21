#!/bin/bash
#
# This script runs in the buildspec before testing
#
# It relies on environment variables to be set to replace placeholder
# values in `example-inputs`.
#
#   FASTLY_SERVICE_ID
#   FASTLY_VERSION_ID
#   Example:
#
#    GITHUB_ORG=ericzbeard-aws-cep-testing GITHUB_REPO=test-stable-1 AWS_PROFILE=ezbeard-cep GITHUB_SHA=6907b5086cfdc46381af05d94c2e41ac6812a962 ./setup.sh

mkdir -p inputs
# semi Random name from uuid but must start with letter
RANDOM_NAME=a$(uuidgen | sed 's/[-]//g')

cat test/integ.yml | sed "s/<RANDOM_NAME>/${RANDOM_NAME}/" > test/integ-unique.yml

python3 ../get_type_configuration.py
