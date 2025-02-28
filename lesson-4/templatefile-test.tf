provider "aws" {
	region = "eu-central-1"
}

resource "aws_instance" "my-web-server1" {
	ami			= "ami-06ee6255945a96aba"
 	instance_type		= "t2.micro"
	vpc_security_group_ids  = [aws_security_group.my-webserver.id]
	user_data 		= templatefile("./script.sh.tpl",{
		f_name = "Edgar"
		l_name = "Harutyunyan"
		name   = ["Vasya","Kolya","Petya"]
}) 

  	tags = {
    		Name = "MyWebServer"
		}
}

resource "aws_security_group" "my-webserver" {
  name = "webserver security group"
  description = "my first securiti group"

  ingress {
	from_port = 80
	to_port   = 80
	protocol  = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}
  ingress {
	from_port = 443
	to_port   = 443
	protocol  = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
 	}
  egress {
	from_port = 0
	to_port   = 0
	protocol  = "-1"
	cidr_blocks = ["0.0.0.0/0"]
 	}
}
