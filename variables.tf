variable "env" {
  description = "The environment name"
  type = string
}
variable "cidr" {
  description = "The CIDR block for the VPC"
  type = string
  
}
variable "instance_tenancy" {
  description = "The tenancy of the instance"
  type = string
  
}
variable "enable_dns_support" {
  description = "Enable DNS support"
  type = bool
}
variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type = bool
}
variable "public_subnets" {
  description = "Map of public subnets"
  type = map(string)
}
variable "private_subnets" {
  description = "Map of private subnets"
  type = map(string)
}

variable "rds_allocated_storage" {
  description = "The allocated storage for the RDS instance"
  type        = number
}

variable "rds_storage_type" {
  description = "The storage type for the RDS instance"
  type        = string
}

variable "rds_engine" {
  description = "The database engine for the RDS instance"
  type        = string
}

variable "rds_engine_version" {
  description = "The engine version for the RDS instance"
  type        = string
}

variable "rds_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
}

variable "rds_multi_az" {
  description = "Whether the RDS instance is multi-AZ"
  type        = bool
}
variable "rds_publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
}
variable "rds_username" {
  description = "The username for the RDS instance"
  type        = string  
  
}
variable "rds_backup_retention_period" {
  description = "The backup retention period for the RDS instance"
  type        = number
}
variable "rds_storage_encrypted" {
  description = "Whether the RDS instance storage is encrypted"
  type        = bool
  
}
variable "rds_sg_ingress_rules" {
  type = any
}
variable "rds_sg_egress_rules" {
  type = any
}


variable "ami_id" {
  description = "The AMI ID to use for the launch template"
  type        = string  
  
}
variable "instance_type" {
  description = "The instance type to use for the launch template"
  type        = string
  
}


