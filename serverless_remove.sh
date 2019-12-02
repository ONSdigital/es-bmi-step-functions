#!/usr/bin/env bash

cd step-function-deploy-repository
echo Destroying serverless bundle...
serverless remove --verbose;