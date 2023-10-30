# -----------------------
# |  General Variables  |
# -----------------------

# -------------------
# |  AWS Variables  |
# -------------------
variable "region" {
  type        = string
  description = "The AWS region where you want to deploy your resources. For example, 'us-east-1' represents the North Virginia region."
}

variable "aws_access_key" {
  type        = string
  description = "The AWS access key used for authentication. Please provide a valid access key to access AWS resources."
}

variable "aws_secret_access_key" {
  type        = string
  description = "The AWS secret access key used for authentication. Make sure to securely store this key and only provide valid credentials for AWS resource access."
}

variable "default_vpc_name" {
  type        = string
  description = "The name of the default VPC in AWS"
}

variable "webserver_security_group_name" {
  type        = string
  description = "Name of the webserver security group"
}

variable "database_security_group_name" {
  type        = string
  description = "Name of the database security group"
}

variable "database_subnet_group_name" {
  type        = string
  description = "Name of the database subnet group"
}

variable "db_instance_engine" {
  type        = string
  description = "Database engine type (e.g., postgres)"
}

variable "db_instance_engine_version" {
  type        = string
  description = "Version of the database engine (e.g., 13.4)"
}

variable "db_instance_multi_az" {
  type        = bool
  description = "Set to true if the database instance is to be deployed in multiple availability zones"
}

variable "db_instance_identifier" {
  type        = string
  description = "Identifier for the database instance"
}

variable "db_instance_username" {
  type        = string
  description = "Username for accessing the database"
}

variable "db_instance_password" {
  type        = string
  description = "Password associated with the database username"
}

variable "db_instance_instance_class" {
  type        = string
  description = "Instance class or type (e.g., db.t3.micro) for the database instance"
}

variable "db_instance_allocated_storage" {
  type        = number
  description = "Amount of allocated storage (in gigabytes) for the database instance"
}

variable "db_instance_db_name" {
  type        = string
  description = "Name of the database in the database instance"
}

variable "db_instance_skip_final_snapshot" {
  type        = bool
  description = "Set to true to skip taking a final snapshot when deleting the database instance"
}
