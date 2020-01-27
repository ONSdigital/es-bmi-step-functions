# es-bmi-step-functions

## Deployment:

When a change is made and pushed to master this will deploy, the pipeline is set-up in a way
in which the step-function will wait for the lambdas to be deployed first.

## Updating Lambda names:

If at any point the names of the lambdas are updated you will need to update the reference
in the secrets manager. This file is called **results-bmi-sg-wranglers**.

## Updating Environment/Account Number:

If you wish to change the environment (Another AWS account) this can be done in the
results-aws-accounts file inside the secrets manager at the top level.


## Custom variables:
Serverless only allows access to AWS secrets manager secret via SSM. However this imposes 
restrictions on the name of the secrets manager secret as well as it's format.

A secrets manager secret named to be accessible to concourse pipelines usually is of the 
form /concourse/$team-name/$secret-name (for team-wide secrets). This secret cannot be 
directly used in Serverless since to access the secret, Serverless goes via Paramter 
Store which cannot resolve the reference due to slashes in the name.
###### __Description provided by Ash__

As a workaround to this issue custom variables are used to store the values and abstract 
away from the code. Another variables also needs to be created referencing the first 
variable this is required as otherwise the slashes won't be interpreted correctly and will
cause the variable to break.

I have provided an example of the variable creation below.
```  
accounts: ${ssm:/aws/reference/secretsmanager/example-secret~true}
accountId: ${self:custom.accounts.account-id}
```

_Example of referencing the variable in-line inside Serverless.sh._

```Resource: "arn:aws:lambda:eu-west-2:${self:custom.accountId}:function:${self:custom.aggregation-top2}"```

## RuntimeVariables:
The runtime variables are configured via the config-loader, more information can be found
on it's git repository. 

The step functions handles which variables are used in each section
while section and also the way in which the variables are picked up from the respective payload.

The implementation used inside of the step function can be found at: 
https://collaborate2.ons.gov.uk/confluence/display/ESD/Spike+-+Step+Function%3A+InputPath+and+Parameters