Java SpringBoot application deployment in eks using helm chart.
Steps:
1.	Before starting of the project, create AWS credintial with Administrator Access.
2.	Configure the credential in cli
3.	Create the required resources using terrafom which is located in the terraform folder.
4.	Login to jenkins server using cli and go to root user
5.	Add the jenkins user to sudo group by editing the file /etc/sudoers and add the below text into that
•	ubuntu ALL=(ALL) NOPASSWD:ALL
6.	Add the jenkins user into the docker group using the below command
•	sudo usermod -aG docker jenkins
7.	switch to jenkins user and login to docker hub for docker scout
8.	Enter the below command to configure docker scout
•	curl -fsSL https://raw.githubusercontent.com/docker/scout-cli/main/install.sh -o install-scout.sh
•	sh install-scout.sh
9.	login to aws cli using credential created step 1.
10.	Update Kube config by entering below command to get kubernetes credentails:
•	aws eks update-kubeconfig --name test-eks-cluster --region ap-south-2
11.	Check the current kubernetes status
12.	Login to sonrqube server through ssh and go to root user.
13.	Issue the below command to start sonarqube server
•	su - postgres
•	createuser sonar
•	psql
•	ALTER USER sonar WITH ENCRYPTED password 'sonar';
•	CREATE DATABASE sonarqube OWNER sonar;
•	GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonar; 
•	\q
•	exit
•	sudo systemctl daemon-reload
•	sudo systemctl enable --now sonar
•	sudo systemctl start sonar

14.	Create a Jenkins pipeline and jenkinsfile is located at https://github.com/prabhat-roy/app-deployment-eks-with-jenkins-java-springboot.git. Also configure github webhook to run Jenkins automatically whenever there is a change in github.
