#!/usr/bin/env bash

cd step-function-deploy-repository

serverless plugin install --name serverless-step-functions
echo Packaging serverless bundle...
serverless package --package pkg
echo Deploying Sand and Gravel to AWS..
serverless deploy --verbose --config sg_serverless.yml;
echo Deploying Blocks to AWS..
serverless deploy --verbose --config blk_serverless.yml;
