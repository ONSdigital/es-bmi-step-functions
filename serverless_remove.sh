#!/usr/bin/env bash

cd step-function-repository

serverless plugin install --name serverless-step-functions
echo Destroying Sand and Gravel serverless bundle...
serverless remove --config sg_serverless.yml --verbose;
echo Destroying Blocks serverless bundle...
serverless remove --config blk_serverless.yml --verbose;
echo Destroying Bricks serverless bundle...
serverless remove --config brk_serverless.yml --verbose;