
resource "aws_instance" "sonar" {
  ami               = var.aws_ami
  instance_type     = var.aws_instance
  subnet_id         = aws_subnet.public_subnet[0].id
  availability_zone = var.azs[0]
  security_groups   = ["${aws_security_group.jenkins.id}"]
  key_name          = var.ssh_key
  user_data = "${file("sonar.sh")}"
  tags = {
    Name = "Sonarqube-Server"
  }
}
/*
resource "null_resource" "sonarqube-server" {
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("Hyd-kp.pem")
    host        = aws_instance.sonar.public_ip
  }
  provisioner "file" {
    source      = "sonar.sh"
    destination = "/tmp/sonar.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/sonar.sh",
      "sh /tmp/jenkins.sh",
    ]
  }
  depends_on = [aws_instance.sonar]
}
*/