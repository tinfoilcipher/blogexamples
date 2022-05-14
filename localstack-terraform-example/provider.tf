provider "aws" {

    #--Standard Provider Configurations
    region     = "eu-west-1"
    default_tags {
        tags = {
            Environment = "dev"
        }
    }

    #--Mocked Credentials
    access_key = "test"
    secret_key = "test"

    #--Forces proper S3 path validation. Hopefully this is in use throughout your code!
    s3_force_path_style         = true
    
    #--These settings allow for authentication and other validations which are enforced
    #--in the AWS provider to be bypassed by Localstack.
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    
    #--Redirect Service Endpoints to Localstack. Whilst we won't be using all of these
    #--these endpoints, they should all be configured to avoid rogue resource creation!
    endpoints {
        apigateway     = "http://localhost:4566"
        cloudformation = "http://localhost:4566"
        cloudwatch     = "http://localhost:4566"
        dynamodb       = "http://localhost:4566"
        ec2            = "http://localhost:4566"
        es             = "http://localhost:4566"
        elasticache    = "http://localhost:4566"
        firehose       = "http://localhost:4566"
        iam            = "http://localhost:4566"
        kinesis        = "http://localhost:4566"
        lambda         = "http://localhost:4566"
        rds            = "http://localhost:4566"
        redshift       = "http://localhost:4566"
        route53        = "http://localhost:4566"
        s3             = "http://s3.localhost.localstack.cloud:4566" #--This format required for s3_force_path_style = true
        secretsmanager = "http://localhost:4566"
        ses            = "http://localhost:4566"
        sns            = "http://localhost:4566"
        sqs            = "http://localhost:4566"
        ssm            = "http://localhost:4566"
        stepfunctions  = "http://localhost:4566"
        sts            = "http://localhost:4566"
    }
}