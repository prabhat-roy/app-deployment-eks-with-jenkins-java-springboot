#!/bin/bash
sudo apt-get update -y
sudo apt-get install git unzip curl -y
wget https://github.com/aquasecurity/trivy/releases/download/v0.49.1/trivy_0.49.1_Linux-64bit.deb
sudo dpkg -i trivy_0.49.1_Linux-64bit.deb
curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sudo sh -s -- -b /usr/local/bin
curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sudo sh -s -- -b /usr/local/bin
sudo apt-get -y install ansible
sudo apt-get install openjdk-21-jdk -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl enable jenkins
cd /opt
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
sudo tar -xvzf apache-maven-3.9.6-bin.tar.gz
sudo rm -rf apache-maven-3.9.6-bin.tar.gz
export PATH=$PATH:/opt/apache-maven-3.9.6/bin
sudo wget https://services.gradle.org/distributions/gradle-8.6-bin.zip
sudo unzip gradle-8.6-bin.zip
export PATH=$PATH:/opt/gradle-8.6/bin
sudo rm -rf unzip gradle-8.6-bin.zip
sudo wget https://dlcdn.apache.org//ant/binaries/apache-ant-1.10.14-bin.zip
sudo unzip apache-ant-1.10.14-bin.zip
sudo rm -rf apache-ant-1.10.14-bin.zip
cat <<EOF | sudo tee /etc/profile.d/ant.sh
ANT_HOME=/opt/apache-ant-1.10.14
PATH=$ANT_HOME/bin:$PATH
EOF
sudo apt-get install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl restart docker
sudo curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
sudo curl -fsSL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh -o install-scout.sh
sudo sh install-scout.sh
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
# sudo adduser jenkins --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
# sudo echo jenkins:jenkins | sudo chpasswd
sudo usermod -aG root jenkins
sudo usermod -aG docker jenkins
sudo wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz
sudo tar xvf helm-v3.9.3-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin
sudo rm helm-v3.9.3-linux-amd64.tar.gz
sudo rm -rf linux-amd64
helm version
sudo cat /var/lib/jenkins/secrets/initialAdminPassword