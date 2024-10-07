module "HA-VPC" {
  source  = "app.terraform.io/shashiorg/HA-VPC/aws"
  version = "0.0.2"
  env = var.env
  cidr = var.cidr
  instance_tenancy = var.instance_tenancy
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
}
module "Public-RTA-IGW" {
  source  = "app.terraform.io/shashiorg/Public-RTA-IGW/aws"
  version = "0.0.1"
    public_subnets = module.HA-VPC.public_subnets
    env = var.env
    vpc_id = module.HA-VPC.vpc_id
}
module "NAT-GATEWAY" {
  source  = "app.terraform.io/shashiorg/NAT-GATEWAY/aws"
  version = "0.0.1"
    public_subnets = module.HA-VPC.public_subnets
    env = var.env
}
module "Private-RTA" {
  source  = "app.terraform.io/shashiorg/Private-RTA/aws"
  version = "0.0.1"
    private_subnets = module.HA-VPC.private_subnets
    env = var.env
    nat_gateway_ids = module.NAT-GATEWAY.nat_gateway_ids
    vpc_id = module.HA-VPC.vpc_id
}
module "RDS" {
  source  = "app.terraform.io/shashiorg/RDS/aws"
  version = "0.0.1"
    env = var.env
    rds_privatesubnets = module.HA-VPC.private_subnets
    rds_allocated_storage = var.rds_allocated_storage
    rds_storage_type = var.rds_storage_type
    rds_engine = var.rds_engine
    rds_engine_version = var.rds_engine_version
    rds_instance_class = var.rds_instance_class
    rds_multi_az = var.rds_multi_az
    rds_sg_ingress_rules = var.rds_sg_ingress_rules
    rds_sg_egress_rules = var.rds_sg_egress_rules
    vpc_id = module.HA-VPC.vpc_id
    rds_publicly_accessible = var.rds_publicly_accessible
    rds_storage_encrypted = var.rds_storage_encrypted
    rds_username = var.rds_username
    rds_backup_retention_period = var.rds_backup_retention_period
}
module "EFS" {
  source  = "app.terraform.io/shashiorg/EFS/aws"
  version = "0.0.1"
    env = var.env
    efs_private_subnets = module.HA-VPC.private_subnets
    vpc_id = module.HA-VPC.vpc_id
    ec2_sg_id = module.rdssg.rds_sg_id
}
data "template_file" "user_data" {
  template = file("./templates/user_data.tpl")
  vars = {
  efs_file_system_id = module.EFS.efs_file_system_id
  }
}


module "Auto-Alb" {
  source  = "app.terraform.io/shashiorg/Auto-Alb/aws"
  version = "0.0.2"
    env = var.env
    local_ssm_policies = local.local_ssm_policies
    ami_id = var.ami_id
    instance_type = var.instance_type
    auto_private_subnets = module.HA-VPC.private_subnets
    auto_public_subnets = module.HA-VPC.public_subnets
    vpc_id = module.HA-VPC.vpc_id
    user_data = data.template_file.user_data
}
