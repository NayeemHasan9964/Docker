FROM ubuntu:22.04

RUN apt update && apt upgrade -y && apt install -y openjdk-11-jdk

# Add Jenkins and Repo
RUN wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian/jenkins.io-2023.key && \
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" > /etc/apt/sources.list.d/jenkins.list

# Install Jenkins
RUN apt-get update && apt-get install -y jenkins    

EXPOSE 8080

# To start Jenkins
CMD ["jenkins"]


