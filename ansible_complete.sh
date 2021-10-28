    cd ec2_complete
    iventory_file="ansible/inventory.yml"

    # Get EC2 public IP
    ec2_pub_ip=$(aws ec2 describe-instances --filter "Name=instance-state-name,Values=running" --query 'Reservations[*].Instances[*].{Name:Tags[?Key==`Name`]|[0].Value,Creation:Tags[?Key==`Creation`]|[0].Value,Instance:InstanceId,AZ:Placement.AvailabilityZone,PrivateIpAddress:PrivateIpAddress,PublicIpAddress:PublicIpAddress,InstanceType:InstanceType}' --profile github-user --region us-east-1 --output text |grep ec2-github-complete | awk '{print $NF}')

    # Update IP in iventory
    sed -i "s|ec2_pub_ip|$ec2_pub_ip|g" $iventory_file

    echo "Enter .pem (complete file path): "
    read pem

    # Update private key
    sed -i "s|pem|$pem|g" $iventory_file

    # Configure instance with Ansible
    ansible-playbook ansible/$1.yml -i $iventory_file
    
    cp $iventory_file.bkp $iventory_file

