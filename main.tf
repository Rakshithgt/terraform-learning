module "s3_backend" {
  source = "./modules/s3_backend"

  bucket_name         = var.backend_bucket_name
  dynamodb_table_name = var.backend_dynamodb_table_name
  tags                = var.tags
}

module "vpc" {
  source = "./modules/vpc"

  name                 = var.project_name
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  tags                 = var.tags
}

module "iam" {
  source = "./modules/iam"

  cluster_name = var.eks_cluster_name
  tags         = var.tags
}

module "eks" {
  source = "./modules/eks"

  cluster_name       = var.eks_cluster_name
  cluster_role_arn   = module.iam.eks_cluster_role_arn
  node_role_arn      = module.iam.eks_node_role_arn
  subnet_ids         = module.vpc.private_subnet_ids
  node_instance_type = var.eks_node_instance_type
  desired_capacity   = var.eks_desired_capacity
  min_capacity       = var.eks_min_capacity
  max_capacity       = var.eks_max_capacity
  tags               = var.tags

  depends_on = [module.iam]
}

module "rds" {
  source = "./modules/rds"

  identifier          = "${var.project_name}-db"
  subnet_ids          = module.vpc.private_subnet_ids
  vpc_id              = module.vpc.vpc_id
  allowed_cidr_blocks = var.rds_allowed_cidr_blocks
  engine              = var.rds_engine
  engine_version      = var.rds_engine_version
  instance_class      = var.rds_instance_class
  allocated_storage   = var.rds_allocated_storage
  db_name             = var.rds_db_name
  username            = var.rds_username
  password            = var.rds_master_password
  tags                = var.tags
}

resource "aws_key_pair" "ec2" {
  key_name   = coalesce(var.ec2_key_name, "${var.project_name}-key")
  public_key = file("${path.module}/.ssh/terraform-learning_ed25519.pub")

  tags = merge(var.tags, {
    Name = coalesce(var.ec2_key_name, "${var.project_name}-key")
  })
}

module "ec2" {
  source = "./modules/ec2"

  name                        = "${var.project_name}-ec2"
  ami_id                      = var.ec2_ami_id
  instance_type               = var.ec2_instance_type
  subnet_id                   = module.vpc.public_subnet_ids[0]
  vpc_id                      = module.vpc.vpc_id
  associate_public_ip_address = var.ec2_associate_public_ip_address
  allowed_ssh_cidr_blocks     = var.ec2_allowed_ssh_cidr_blocks
  key_name                    = aws_key_pair.ec2.key_name
  tags                        = var.tags
}
