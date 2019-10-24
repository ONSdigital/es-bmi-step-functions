#!/usr/bin/env bash

cd bmi-step-functions

serverless plugin install --name serverless-step-functions
echo Packaging serverless bundle...
serverless package --package pkg
echo Deploying to AWS...
serverless deploy --verbose;