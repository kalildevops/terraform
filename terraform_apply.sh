# Create and init backend (tfstate)
cd tfstate && terraform init && terraform apply

# Terraform apply stack using $1
if [ $1 = "ec2" ]; then
    cd ../ec2
    myip=$(curl -s ifconfig.me |sed "s/%//g")
    gsed -i "s|cidr_blocksx|cidr_blocks = [ \"$myip/32\" ]|g" variables.tf
else
    cd ../$1
fi

terraform init && terraform apply

# Clear
cd ../
find . -name terraform.tfstate -exec rm -rf {} \;
find . -name .terraform* -exec rm -rf {} \;