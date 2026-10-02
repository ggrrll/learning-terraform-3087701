data "aws_ami" "app_ami" {
  most_recent = true

  # AWS Marketplace account ID (where official Bitnami AMIs are hosted)
  owners = ["679593333241"]

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.nano"

  tags = {
    Name = "HelloWorld"
  }
}