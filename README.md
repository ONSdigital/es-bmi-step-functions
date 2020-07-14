# es-bmi-step-functions

This repository contains all of the BMI Step functions. They are stored within serverless.yml files.

The Majority of the step functions work in the same way but the order has been changed due to the 
way the system operates. 

The configuration of runtime variables required for each run are contained
in the respective systems config files, located on AWS in the Results bucket inside the configs folder.

## Sand & Gravel
Module Order:
1. Enrichment
2. Strata
3. Imputation Movement
4. Imputation Add GB Region
5. Imputation Means
6. Imputation IQRS
7. Imputation Atypicals
8. Imputation Re-Calculate Means
9. Imputation Calculate Factors
10. Imputation Apply Factors
11. Aggregation
    a. County Total (aggregate by column)
    b. EntRef Count (aggregate by column)
    c. Calculate Top2
12. Combiner
13. Disclosure 

## Blocks
Module Order:
1. Enrichment
2. Imputation Movement
3. Imputation Means
4. Imputation IQRS
5. Imputation Atypicals
6. Imputation Add GB Region
7. Imputation Re-Calculate Means
8. Imputation Calculate Factors
9. Imputation Apply Factors
10. Aggregation
    a. County Total (aggregate by column)
    b. EntRef Count (aggregate by column)
    c. Calculate Top2
11. Combiner
12. Disclosure 

## Bricks
Module Order: 
1. Enrichment
2. Imputation Movement
3. Imputation Means
4. Imputation IQRS
5. Imputation Atypicals
6. Imputation Re-Calculate Means
7. Imputation Calculate Factors
8. Imputation Apply Factors
9. Re-Organise Data (calls out to add GB region)
10. Region Aggregation
    a. Region County Total (aggregate by column)
    b. Region EntRef Count (aggregate by column)
    c. Region Calculate Top2
11. Region Combiner
12. Region Disclosure
13. Brick Aggregation
    a. Brick County Total (aggregate by column)
    b. Brick EntRef Count (aggregate by column)
    c. Brick Calculate Top2
14. Brick Combiner
15. Brick Disclosure

## Deployment:

When a change is made and pushed to master this will deploy, the pipeline is set-up in a way
in which the step-function will wait for the lambdas to be deployed first.

## Updating Lambda names:

If at any point the names of the lambdas are updated you will need to update the reference
in the project. This file is called wranglers.json.

## Custom variables:
Custom variables are passed in via file and via environment.<br>
Environment is set by the concourse pipeline before these scripts are run.<br>
wranglers is a json file in the root of this folder.
```  
environment: ${env:ENVIRONMENT}
wranglers: ${file(./wranglers.json)}
ingest: ${self:custom.wranglers.ingest-data}
```

AccountID is retrieved using serverless-pseudo-parameters plugin as per the below

```Resource: "arn:aws:lambda:eu-west-2:#{AWS::AccountId}:function:${self:custom.enrichment}"```

## RuntimeVariables:
The runtime variables are configured via the config-loader, more information can be found
on it's git repository. 

The step functions handles which variables are used in each section
while section and also the way in which the variables are picked up from the respective payload.

The implementation used inside of the step function can be found at: 
https://collaborate2.ons.gov.uk/confluence/display/ESD/Spike+-+Step+Function%3A+InputPath+and+Parameters

## Good to knows / Gotchas:
Due to the way in which Serverless acts with our CI/CD pipeline means that the our directory
requires a serverless.yml file to mark it as a Serverless directory, Without this our scripts fail. 

This is why there is a generic template filler for Serverless.yml in the directory.

