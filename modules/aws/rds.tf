# create security group for the database
resource "aws_security_group" "database_security_group" {
  name        = var.database_security_group_name
  description = "enable postgresql access on port 5432"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {
    description      = "postgres access"
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    security_groups  = [aws_security_group.webserver_security_group.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    name = var.database_security_group_name
  }
  depends_on = [ aws_security_group.webserver_security_group ]
}


# create the subnet group for the rds instance
resource "aws_db_subnet_group" "database_subnet_group" {
  name         = var.database_subnet_group_name
  subnet_ids   = [aws_default_subnet.subnet_az1.id, aws_default_subnet.subnet_az2.id]
  description  = "subnets for database instances"

  tags   = {
    name = var.database_subnet_group_name
  }
}


# create the rds instance
resource "aws_db_instance" "db_instance" {
  engine                  = var.db_instance_engine
  engine_version          = var.db_instance_engine_version
  multi_az                = var.db_instance_multi_az
  identifier              = var.db_instance_identifier
  username                = var.db_instance_username
  password                = var.db_instance_password
  instance_class          = var.db_instance_instance_class
  allocated_storage       = var.db_instance_allocated_storage
  db_subnet_group_name    = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.database_security_group.id]
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  db_name                 = var.db_instance_db_name
  skip_final_snapshot     = var.db_instance_skip_final_snapshot
}
