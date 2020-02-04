#!/usr/bin/env bash

cd step-function-deploy-repository

serverless plugin install --name serverless-step-functions
echo Packaging serverless bundle...
serverless package --package pkg
echo Deploying Sand and Gravel to AWS..
serverless deploy --config sg_serverless.yml --verbose;
echo Deploying Blocks to AWS..
serverless deploy --config blk_serverless.yml --verbose;
