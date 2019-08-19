#/bin/bash
mkdir -p /usr/local/share/ca-certificates/gitlab
cp ~/git.0x8.ch.cert /usr/local/share/ca-certificates/gitlab/git.0x8.ch.crt
chmod 755 /usr/local/share/ca-certificates/gitlab
chmod 644 /usr/local/share/ca-certificates/gitlab/git.0x8.ch.crt
update-ca-certificates
