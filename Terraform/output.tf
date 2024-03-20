output "jenkins-url" {
  value = join("", ["http://", aws_instance.jenkins.public_ip, ":", "8080"])
}
output "sonar-ip" {
  value = join("", ["http://", aws_instance.sonar.public_ip, ":", "9000"])
}
/*
output "my_public_ip" {
  value = format(jsondecode(data.http.ipinfo.body).ip)
}
*/