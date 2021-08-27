# Destroy EC2 and SG
cd ec2 && terraform init && terraform destroy

cd ../
find . -name terraform.tfstate -exec rm -rf {} \;
find . -name .terraform* -exec rm -rf {} \;
