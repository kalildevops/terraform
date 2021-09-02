# Description
This automation create AWS resources. The tfstate file is stored on S3

## Create resources

``` ./terraform_apply.sh <SERVICE> ```

Ex:

``` ./terraform_apply.sh ec2_only ```

If you choose ec2_complete, you must entry your .pem file path to Ansible can connect in your EC2

## Destroy resources

``` ./terraform_destroy.sh <SERVICE> ```

Ex:

``` ./terraform_destroy.sh ec2_only ```

