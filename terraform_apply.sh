# Create and init backend (tfstate)
cd tfstate && terraform init && terraform apply -auto-approve

update_sg() {
    myip=$(curl -s ifconfig.me |sed "s/%//g")
    gsed -i "s|cidr_blocksx|cidr_blocks = [ \"$myip/32\" ]|g" variables.tf
}

# Verify if service is EC2 for customize SG ingress
if [ $1 = "ec2_complete" ]; then
    cd ../$1
    iventory_file="ansible/inventory.yml"
    update_sg

    # Create infra with Terraform
    terraform init && terraform apply
    
    # Get EC2 public IP
    ec2_pub_ip=$(aws ec2 describe-instances --filter "Name=instance-state-name,Values=running" --query 'Reservations[*].Instances[*].{Name:Tags[?Key==`Name`]|[0].Value,Creation:Tags[?Key==`Creation`]|[0].Value,Instance:InstanceId,AZ:Placement.AvailabilityZone,PrivateIpAddress:PrivateIpAddress,PublicIpAddress:PublicIpAddress,InstanceType:InstanceType}' --profile github-user --region us-east-1 --output text |grep ec2-github | awk '{print $NF}')
    
    # Update IP in iventory
    gsed -i "s|ec2_pub_ip|$ec2_pub_ip|g" $iventory_file

    echo "Enter .pem (complete file path): "
    read pem

    # Update private key
    gsed -i "s|pem|$pem|g" $iventory_file

    # Configure instance with Ansible
    ansible-playbook ansible/playbook.yml -i $iventory_file
    
    cp $iventory_file.bkp $iventory_file
    cp variables.tf.bkp variables.tf

elif [ $1 = "ec2_only" ] ; then
    cd ../$1

    update_sg

    # Create infra with Terraform
    terraform init && terraform apply

    cp variables.tf.bkp variables.tf

else
    cd ../$1
    # Create infra with Terraform
    terraform init && terraform apply
fi