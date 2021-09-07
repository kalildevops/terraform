data "aws_subnet" "subnet_priv1" {
  filter {
    name   = "tag:Name"
    values = ["vpc-eks-only-subnet-priv1"]
  }
}

data "aws_subnet" "subnet_priv2" {
  filter {
    name   = "tag:Name"
    values = ["vpc-eks-only-subnet-priv2"]
  }
}

data "aws_subnet" "subnet_pub1" {
  filter {
    name   = "tag:Name"
    values = ["vpc-eks-only-subnet-pub1"]
  }
}

data "aws_subnet" "subnet_pub2" {
  filter {
    name   = "tag:Name"
    values = ["vpc-eks-only-subnet-pub2"]
  }
}

resource "aws_eks_cluster" "this" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.this.arn
  version = "1.21"

  vpc_config {
    subnet_ids = [
        data.aws_subnet.subnet_priv1.id,
        data.aws_subnet.subnet_priv2.id,
        data.aws_subnet.subnet_pub1.id,
        data.aws_subnet.subnet_pub2.id
    ]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController
  ]
}