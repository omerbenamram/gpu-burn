set -ex

# This script is inspired by: 
# https://github.com/mdegans/docker-tegra-ubuntu/blob/l4t-base/tegra-ubuntu.Dockerfile

SOC=t194 # XAVIER

apt-get update && apt-get install -y \
        curl \
        cmake \
        git \
        libclang-dev \
        libgstreamer1.0-dev \
        libgstreamer-plugins-base1.0-dev \
        libgstreamer-plugins-good1.0-dev \
        libglib2.0-dev \
        libstdc++-7-dev \
        libssl-dev \
        libusb-1.0-0-dev \
        libudev-dev \
        pkg-config \
        ssh \
        && rm -rf /var/lib/apt/lists/*

wget https://repo.download.nvidia.com/jetson/jetson-ota-public.asc -o /etc/apt/trusted.gpg.d/jetson-ota-public.asc
apt-get update && apt-get install -y dirmngr
apt-key adv --fetch-key https://repo.download.nvidia.com/jetson/jetson-ota-public.asc

chmod 644 /etc/apt/trusted.gpg.d/jetson-ota-public.asc \
    && apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
    && echo "deb https://repo.download.nvidia.com/jetson/common r32.5 main" > /etc/apt/sources.list.d/nvidia-l4t-apt-source.list \
    && echo "deb https://repo.download.nvidia.com/jetson/${SOC} r32.5 main" >> /etc/apt/sources.list.d/nvidia-l4t-apt-source.list \
    && apt-get update \
    && rm -rf /var/lib/apt/lists/*

apt-get update && apt-get install -y \
    cuda-toolkit-10-2 \
    libcudnn8 \
    libnvinfer7 \
    libnvparsers7 \
    libnvinfer-plugin7 \
    libnvonnxparsers7 \
    && rm -rf /var/lib/apt/lists/*

