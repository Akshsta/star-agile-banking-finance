provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "finance_app" {
  ami           = "ami-084568db4383264d4" # update this
  instance_type = "t2.large"
  key_name      = "project"
  tags = {
    Name = "FinanceMeApp"
  }

  provisioner "remote-exec" {
    inline = [
      "docker pull 123456789012.dkr.ecr.us-east-1.amazonaws.com/finance-me",
      "docker run -d -p 8081:8081 banking:latest"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/project.pem")
    host        = 54.204.216.3
  }
}
           
