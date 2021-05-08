provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAWADE3L6ZDFMLH3XY"
  secret_key = "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"
}


# step: 1  --> Launching ec2 instance

resource "aws_instance" "myos" {
  ami = "ami-0a9d27a9f4f5c0efc"
  instance_type = "t2.micro"


}


# step: 2  --> creating volume
resource "aws_ebs_volume" "myvol" {
  availability_zone = aws_instance.myos.availability_zone 
  size = 40

  
}


# step: 3 --> attaching ebs to os

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.myvol.id
  instance_id = aws_instance.myos.id
}




