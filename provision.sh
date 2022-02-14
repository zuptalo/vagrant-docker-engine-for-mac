# Installing Docker

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose -y

sudo usermod -aG docker vagrant

# Configuring Docker to listen on a TCP socket

sudo mkdir /etc/systemd/system/docker.service.d

echo \
'[Service]
ExecStart=
ExecStart=/usr/bin/dockerd --containerd=/run/containerd/containerd.sock' | sudo tee /etc/systemd/system/docker.service.d/docker.conf > /dev/null

echo \
'{
  "hosts": ["fd://", "tcp://0.0.0.0:2375"]
}' | sudo tee /etc/docker/daemon.json > /dev/null

sudo systemctl daemon-reload
sudo systemctl restart docker.service
