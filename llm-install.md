#setting up git for the first time for user
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
#

1) sudo apt update   --> installs updates
2) sudo apt install -y podman --> installs podman
3) podman --version
4) podman build -t ollama-gpu-custom . --> downloading image and creating container as per Dockerfile
5) repo setup nvida toolkit
    curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
    && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
6) 
   install nvidia toolkit 
    sudo apt-get update
    sudo apt-get install -y nvidia-container-toolkit
7) 
   sudo nvidia-ctk cdi generate --output=/etc/cdi nvidia.yaml
8) 
podman run -d \
  --name llama32-server \
  --device nvidia.com/gpu=all \
  --security-opt label=disable \
  -v ollama_storage:/root/.ollama \
  -p 11434:11434 \
  ollama-gpu-custom

9) 
  podman exec -it llama32-server ollama run llama3.2

# Install the toolkit
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit