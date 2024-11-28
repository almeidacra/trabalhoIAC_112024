resource "aws_security_group" "sg_publico" {
  name        = "acesso-publico"
  description = "Permitir acesso público ao HTTP e SSH"

  ingress {
    description = "Permitir HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Permitir SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Permitir todo trafego de saida"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_rds" {
  name        = "sg_rds"
  description = "Acesso privado ao RDS"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.sg_publico.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "servidor_lamp" {
  ami                   = var.ami_id
  instance_type         = var.instance_type
  key_name              = "keys.pem"
  vpc_security_group_ids = [aws_security_group.sg_publico.id]
  user_data             = file("scripts/lamp.sh")

  tags = {
    Name = "Servidor1-LAMP"
  }
}

resource "aws_instance" "servidor_nginx" {
  ami                   = var.ami_id
  instance_type         = var.instance_type
  key_name              = "keys.pem"
  vpc_security_group_ids = [aws_security_group.sg_publico.id]
  user_data             = file("scripts/nginx.sh")

  tags = {
    Name = "Servidor2-NGINX"
  }
}

variable "rds_password" {
  description = "senha do bd"
  type        = string
}

resource "aws_db_instance" "rds" {
  allocated_storage     = 20
  engine                = "postgres"
  instance_class        = "db.t2.micro"
  db_name               = "dbpostgres"
  username              = "admin"
  password              = var.rds_password
  skip_final_snapshot   = true
  publicly_accessible   = false
  vpc_security_group_ids = [aws_security_group.sg_rds.id]

  tags = {
    Name = "meurds"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "meu-bucket-trablhoiac"

  tags = {
    Name = "trabalhoiac"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}