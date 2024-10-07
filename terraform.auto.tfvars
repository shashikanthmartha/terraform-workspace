env                 = "dev"
cidr                 = "10.0.0.0/16"
instance_tenancy     = "default"
enable_dns_hostnames = true
enable_dns_support   = true
public_subnets = {
  "ap-south-1a" = "10.0.1.0/24"
  "ap-south-1b" = "10.0.2.0/24"
}
private_subnets = {
  "ap-south-1a" = "10.0.3.0/24"
  "ap-south-1b" = "10.0.4.0/24"
}
rds_allocated_storage = 20  
rds_storage_type      = "gp2"
rds_engine           = "mysql"
rds_engine_version   = "5.7"
rds_instance_class   = "db.m5.large"
rds_multi_az         = true
rds_backup_retention_period = 7
rds_publicly_accessible = false
rds_storage_encrypted = true
rds_username = "admin"
rds_sg_ingress_rules = {
  https = {
    from_port   = 3306
    to_port     = 3306
    cidr_blocks = ["0.0.0.0/0"]
  }
}
rds_sg_egress_rules = {
  https = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

instance_type = "t3a.medium"
ami_id        = "ami-09298640a92b2d12c" # Replace with a valid AMI ID for your region
