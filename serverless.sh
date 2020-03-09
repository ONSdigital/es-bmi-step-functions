#!/usr/bin/env bash

cd es-bmi-step-functions-deploy-repository

serverless plugin install --name serverless-step-functions
echo Deploying Sand and Gravel to AWS...
serverless deploy --config sg_serverless.yml --verbose;
echo Deploying Blocks to AWS...
serverless deploy --config blk_serverless.yml --verbose;
echo Deploying Bricks to AWS...
serverless deploy --config brk_serverless.yml --verbose;
