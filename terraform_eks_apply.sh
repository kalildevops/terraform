# Create and init backend (tfstate)
cd tfstate && terraform init && terraform apply

# Create EKS Network and Cluster
cd ../eks
terraform init && terraform apply

# Clear
cd ../
find . -name terraform.tfstate -exec rm -rf {} \;
find . -name .terraform* -exec rm -rf {} \;