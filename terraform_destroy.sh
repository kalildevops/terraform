cd $1

# Change SG
myip=$(curl -s ifconfig.me |sed "s/%//g")
sed -i "s|cidr_blocksx|cidr_blocks = [ \"$myip/32\" ]|g" variables.tf

# Destroy resources
terraform init && terraform destroy

# Clear
cp variables.tf.bkp variables.tf