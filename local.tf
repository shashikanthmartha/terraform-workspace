locals {
  local_ssm_policies = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonSSMFullAccess",
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
    "arn:aws:iam::aws:policy/AmazonSSMManagedEC2InstanceDefaultPolicy"
  ]
  # target_subnet_id = { for k, s in aws_subnet.public : k => s.id if s.cidr_block == "10.0.1.0/24" }
}
