Purpose:
This is a simple, two part project for creating a callable lambda function.

Lambda Function
The lambda function is written in python.  It does a simple task of responding with a "Hello" message.

Deployment
This uses terraform to create the lambda function, a role for its execution and the URL so that the function may be called.

Pre-requisits
terraform cli v 1.3.3
aws cli 2.8.6.
AWS Account Free Tier.
AWS S3 bucket for terraform Statefiles.
AWS IAM User with full Lambda permissions, iam:CreateRole and write permissions to the S3 bucket.
AWS IAM Key and Secret for use with terraform cli.

Installation
1.  Zip up the python file in HENI-CHALLENGE/hello-heni/hello.py into a hello.zip file in the same folder
2.  Open up a shell prompt at HENI-CHALLENGE/terraform and run the following commands
    a. aws configure
        follow the prompts to enter your AWS IAM Key, Secret Key and region
    b. terraform init
    c. terraform apply -auto-approve -var-file=inputs.tfvars

Execution
1. Open a browser and put this in to the address url:
    https://3du6n7x6wcbwndwtxuohuuvgsa0jytbe.lambda-url.eu-west-1.on.aws/   

Contacts
For any further information or suggetions, please email:
daniel.pj.dunbar@gmail.com
