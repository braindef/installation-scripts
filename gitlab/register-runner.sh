#!/bin/bash

red="\e[91m"
cyan="\e[36m"
default="\e[39m"

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, you need to pass the gitlab-runner-token"
    echo "gitlab -> group -> project -> settings -> ci/cd -> runners (expand)"
    echo eg:
    echo -e marc@debian:~/$ ${cyan}./register-runner.sh ${red}pVCDczkaYKUNzwMnH5gZ${default}
    exit
fi

sudo apt-get install curl

curl -sSL https://get.docker.com/ | sh
sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
sudo chmod +x /usr/local/bin/gitlab-runner
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
sudo gitlab-runner start

echo testing the docker images and start them with ${cyan}sudo docker run -ti debian "/bin/bash"${default}
sudo docker run -ti debian bash -c "uname -a && cat /etc/apt/sources.list"
sudo docker run -ti debian:stretch bash -c "uname -a && cat /etc/apt/sources.list"
sudo docker run -ti debian:buster bash -c "uname -a && cat /etc/apt/sources.list"
sudo docker run -ti ubuntu bash -c "uname -a && cat /etc/apt/sources.list"
sudo docker run -ti centos bash -c "uname -a && yum --version"


sudo gitlab-runner register --url "https://git.0x8.ch/" --registration-token $1 --executor "docker" --docker-image debian:stretch --description "stretch" --tag-list "stretch" --run-untagged="false" --locked="false"

sudo gitlab-runner register --url "https://git.0x8.ch/" --registration-token $1 --executor "docker" --docker-image debian:buster --description "buster" --tag-list "buster" --run-untagged="false" --locked="false"

sudo gitlab-runner register --url "https://git.0x8.ch/" --registration-token $1 --executor "docker" --docker-image ubuntu --description "ubuntu" --tag-list "ubuntu" --run-untagged="false" --locked="false"

sudo gitlab-runner register --url "https://git.0x8.ch/" --registration-token $1 --executor "docker" --docker-image centos --description "centos" --tag-list "centos" --run-untagged="false" --locked="false"


sudo gitlab-runner list

sudo gitlab-runner run docker-runner &

sudo systemctl restart docker
sudo systemctl enable docker

