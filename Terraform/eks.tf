
resource "aws_eks_cluster" "cluster-1" {
  name     = "test-eks-cluster"
  role_arn = aws_iam_role.master.arn
  vpc_config {
    subnet_ids = [
      aws_subnet.private_subnet[0].id,
      aws_subnet.private_subnet[1].id,
      aws_subnet.private_subnet[2].id
    ]
  }
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]
}

resource "aws_eks_node_group" "worker-node-group" {
  cluster_name    = aws_eks_cluster.cluster-1.name
  node_group_name = "worker-node-group-1"
  node_role_arn   = aws_iam_role.worker.arn
  subnet_ids = [
    aws_subnet.private_subnet[0].id,
    aws_subnet.private_subnet[1].id,
    aws_subnet.private_subnet[2].id
  ]
  instance_types = [var.aws_instance]
  capacity_type  = "ON_DEMAND"
  remote_access {
    ec2_ssh_key               = var.ssh_key
    source_security_group_ids = [aws_security_group.jenkins.id]
  }

  scaling_config {
    desired_size = 3
    max_size     = 5
    min_size     = 1
  }
  update_config {
    max_unavailable = 1
  }

tags = {
    Name = "EKS Worker Node"
  }
  
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}
