# Create and init backend (tfstate)
cd tfstate && terraform init && terraform apply

# Set user ip in SG
cd ../ec2
myip=$(curl -s ifconfig.me |sed "s/%//g")
gsed -i "s|cidr_blocksx|cidr_blocks = [ \"$myip/32\" ]|g" variables.tf
terraform init && terraform apply
cp variablesbkp variables.tf

cd ../
find . -name terraform.tfstate -exec rm -rf {} \;
find . -name .terraform* -exec rm -rf {} \;