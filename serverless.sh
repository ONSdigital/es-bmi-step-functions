#!/usr/bin/env bash

cd es-bmi-step-functions-deploy-repository
export SLS_DEBUG=1
serverless plugin install --name serverless-step-functions
echo Deploying Sand and Gravel to AWS...
serverless print --config sg_serverless.yml
serverless deploy --config sg_serverless.yml --verbose;
echo Deploying Blocks to AWS...
serverless deploy --config blk_serverless.yml --verbose;
echo Deploying Bricks to AWS...
serverless deploy --config brk_serverless.yml --verbose;
