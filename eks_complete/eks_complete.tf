resource "aws_eks_cluster" "this" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.this.arn
  version = "1.21"

  vpc_config {
    subnet_ids = [
        module.network_eks.subnet_priv1_id,
        module.network_eks.subnet_priv2_id,
        module.network_eks.subnet_pub1_id,
        module.network_eks.subnet_pub2_id
    ]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController
  ]
}