# Destroy EKS
cd eks && terraform init && terraform destroy

cd ../
find . -name terraform.tfstate -exec rm -rf {} \;
find . -name .terraform* -exec rm -rf {} \;
