resource "aws_eks_cluster" "this" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.this.arn

  vpc_config {
    subnet_ids = [
        aws_subnet.subnet_priv1.id,
        aws_subnet.subnet_priv2.id,
        aws_subnet.subnet_pub1.id,
        aws_subnet.subnet_pub2.id
    ]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController
  ]
}