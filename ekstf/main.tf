

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "demo-cluster"
  cluster_version = "1.31"

  vpc_id = "vpc-0ae24fecf35a03081"

  subnet_ids = [
    "subnet-03fffb70d4e60ba2c",
    "subnet-0e87e1a3c90d57e3a"
  ]

  enable_cluster_creator_admin_permissions = true
  enable_irsa = false
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.micro"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}
