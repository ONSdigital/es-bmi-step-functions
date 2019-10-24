#!/usr/bin/env bash

cd bmi-step-functions

serverless plugin install --name serverless-step-functions
serverless plugin install --name serverless-pseudo-parameters
echo Packaging serverless bundle...
serverless package --package pkg
echo Deploying to AWS...
serverless deploy --verbose;