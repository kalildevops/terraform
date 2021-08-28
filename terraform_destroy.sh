# Destroy resources
cd $1 && terraform init && terraform destroy

# Clear
cd ../
find . -name terraform.tfstate -exec rm -rf {} \;
find . -name .terraform* -exec rm -rf {} \;
