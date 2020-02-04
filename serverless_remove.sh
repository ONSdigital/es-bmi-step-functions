#!/usr/bin/env bash

cd step-function-repository

serverless plugin install --name serverless-step-functions
echo Destroying Sand and Gravel serverless bundle...
serverless remove --verbose --config sg_serverless.yml;
echo Destroying Blocks serverless bundle...
serverless remove --verbose --config blk_serverless.yml;
