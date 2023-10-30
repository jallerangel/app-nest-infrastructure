terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 0.13"
}


module "aws" {
  source                          = "./modules/aws"
  region                          = var.region
  aws_access_key                  = var.aws_access_key
  aws_secret_access_key           = var.aws_secret_access_key
  default_vpc_name                = var.default_vpc_name
  webserver_security_group_name   = var.webserver_security_group_name
  database_security_group_name    = var.database_security_group_name
  database_subnet_group_name      = var.database_subnet_group_name
  db_instance_engine              = var.db_instance_engine
  db_instance_engine_version      = var.db_instance_engine_version
  db_instance_multi_az            = var.db_instance_multi_az
  db_instance_identifier          = var.db_instance_identifier
  db_instance_username            = var.db_instance_username
  db_instance_password            = var.db_instance_password
  db_instance_instance_class      = var.db_instance_instance_class
  db_instance_allocated_storage   = var.db_instance_allocated_storage
  db_instance_db_name             = var.db_instance_db_name
  db_instance_skip_final_snapshot = var.db_instance_skip_final_snapshot

}