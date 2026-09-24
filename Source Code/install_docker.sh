echo  "[TASK 1] Install Docker"
echo  "[TASK 1.1] Remove old versions"
sudo apt-get remove -y docker docker-engine docker.io containerd runc

echo  "[TASK 1.2] Update"
sudo apt-get -y update

echo  "[TASK 1.3] Install packages"
sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo  "[TASK 1.4] Add Docker’s official GPG key"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo  "[TASK 1.5] Set up the stable repository"
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo  "[TASK 1.6] Update"
sudo apt-get -y update

echo  "[TASK 1.7] Install Docker"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo  "[TASK 1.8] Create docker group"
sudo groupadd docker

echo  "[TASK 1.9] Add user to docker group"
sudo usermod -aG docker $USER

echo  "[TASK 1.10] Enable new user"
newgrp docker