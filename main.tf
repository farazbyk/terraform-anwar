provider "aws" {
  version = "~> 3.0"
  region  = "us-east-1"
  profile = "default"
}
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIBx1FXxaa/GN+jf597bj3mQrhril+IyyNEOmYD7mDDATJ33s7UUt/QHz+LTHGsdhXD0Td6hBy6BYeuqL66MBTFY5ccmtNiy8Ot0ErPbEKHv0HBAFucbN1jjItcVov1ETCchbFQzeWoOm8BiVPYNDAvAJgnzLRzZys5rHrr46ISn2CaxJuT4S2uixHYv+wfhOGagpnBDzIhWGG8zI9b5krNj+QyYQ9j37O314YgRFQdOPNs0sUKV2kkSjuSpOCbiNYnEDxtgNKjg3/UelPwTF1XrtQavgW0vkd4zfggJpzT/beaiqHNUdIjKQUcLn8QSek9YCEwmF5h9Hkn6q/sLOT"
}

resource "aws_instance" "example" {
  ami           = "ami-04ad2567c9e3d7893"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-08fea0f6be8bd1180"]
  subnet_id   = "subnet-98008bb7"
  key_name = aws_key_pair.deployer.key_name
  tags = {
      "Name" = "ec2-terraform-faraz"  }
  }
