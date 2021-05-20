FROM nvcr.io/nvidia/l4t-base:r32.5.0

RUN apt update && apt install -y build-essential
COPY install_cuda.sh /tmp/
RUN chmod +x /tmp/install_cuda.sh && /tmp/install_cuda.sh

ENTRYPOINT ["/bin/bash"]
