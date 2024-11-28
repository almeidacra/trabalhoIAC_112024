resource "aws_instance" "server1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "keys.pem"
  user_data     = file("lamp.sh")

  tags = {
    Name = "Server1-LAMP"
  }
}

resource "aws_instance" "server2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "keys.pem"
  user_data     = file("nginx.sh")

  tags = {
    Name = "Server2-NGINX"
  }
}

resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  engine               = "postgres"
  instance_class       = "db.t2.micro"
  db_name              = "dbpostgres"   
  username             = "admin"
  password             = "admin"
  skip_final_snapshot  = true

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
