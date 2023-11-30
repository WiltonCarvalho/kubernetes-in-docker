#!/bin/sh
set -e
# workaround from docker:dind - /usr/local/bin/dind
mount -t securityfs none /sys/kernel/security
mkdir -p /sys/fs/cgroup/init
xargs -rn1 < /sys/fs/cgroup/cgroup.procs > /sys/fs/cgroup/init/cgroup.procs
sed -e 's/ / +/g' -e 's/^/+/' < /sys/fs/cgroup/cgroup.controllers > /sys/fs/cgroup/cgroup.subtree_control
mount --make-rshared /

# docker config
mkdir -p /etc/docker
cat <<'EOF'> /etc/docker/daemon.json
{
  "storage-driver": "overlay2",
  "iptables": true,
  "ipv6": false,
  "tls": false,
  "features": {
    "buildkit": true
  },
  "hosts": [
    "unix:///var/run/docker.sock"
  ],
  "pidfile": "/var/run/docker.pid",
  "group": "wheel",
  "exec-opts": ["native.cgroupdriver=cgroupfs"]
}
EOF

# start dockerd
rm -f /var/run/docker.pid
nohup dockerd \
  --insecure-registry=registry.172.19.255.201.sslip.io \
  &>/var/log/docker.log &
