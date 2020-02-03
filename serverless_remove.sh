#!/usr/bin/env bash

cd step-function-repository

serverless plugin install --name serverless-step-functions
echo Destroying serverless bundle...
serverless remove --verbose --config sg_serverless.yml;
