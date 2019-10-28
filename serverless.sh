#!/usr/bin/env bash

cd step-function-deploy-repository

serverless plugin install --name serverless-step-functions
echo Packaging serverless bundle...
serverless package --package pkg
echo Deploying to AWS...
serverless deploy --verbose;