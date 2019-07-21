#!/bin/bash
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
sudo apt-get install gitlab-ee gitlab-runner
sudo gitlab-ctl reconfigure
sudo gitlab-runner register
sudo gitlab-runner start
sudo gitlab-ctl reconfigure
