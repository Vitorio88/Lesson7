resource "aws_instance" "ubuntu" {
  ami           = "ami-05f7491af5eef733a"
  instance_type = "t2.micro" 
}
