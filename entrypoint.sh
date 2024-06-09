#!/bin/bash
./config.sh --unattended --url ${GITHUB_URL} --token ${GITHUB_TOKEN} --name ${RUNNER_NAME} --labels ${RUNNER_LABEL}
./run.sh