provider "aws" {
  region     = "us-east-1"
  #access_key = ""
  #secret_key = ""
}

# Get default VPC
data "aws_vpc" "default" {
  default = true
}

# Get a subnet in the default VPC
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

resource "aws_instance" "web" {
  ami           = "ami-05ffe3c48a9991133"
  instance_type = "t3.micro"
  subnet_id     = data.aws_subnet_ids.default.ids[0]
  
  # Use security group explicitly if needed
  # vpc_security_group_ids = ["sg-xxxx"]
}

#resource "aws_instance" "web" {
#  ami           = "ami-05ffe3c48a9991133"
#  instance_type = "t3.micro"
#}



