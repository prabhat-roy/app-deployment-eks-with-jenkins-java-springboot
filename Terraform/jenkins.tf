resource "aws_instance" "jenkins" {
  ami                  = var.aws_ami
  instance_type        = var.aws_instance
  subnet_id            = aws_subnet.public_subnet[0].id
  availability_zone    = var.azs[0]
  security_groups      = ["${aws_security_group.jenkins.id}"]
  key_name             = var.ssh_key
  iam_instance_profile = aws_iam_instance_profile.eks-profile.name
  user_data = "${file("jenkins.sh")}"
  tags = {
    Name = "Jenkins-Server"
  }
}
/*
resource "null_resource" "jenkins-server" {
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("Hyd-kp.pem")
    host        = aws_instance.jenkins.public_ip
  }
  provisioner "file" {
    source      = "jenkins.sh"
    destination = "/tmp/jenkins.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/jenkins.sh",
      "sh /tmp/jenkins.sh",
    ]
  }
  depends_on = [aws_instance.jenkins]
}
*/