#!/usr/bin/env bash

cd step-function-repository
echo Destroying serverless bundle...
serverless remove --verbose;
