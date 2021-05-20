FROM nvcr.io/nvidia/l4t-base:r32.5.0 AS builder

RUN apt update && apt install -y build-essential
COPY install_cuda.sh /tmp/
RUN chmod +x /tmp/install_cuda.sh && /tmp/install_cuda.sh

WORKDIR /gpu-burn
COPY . .

RUN make

ENTRYPOINT ["/bin/bash"]

#WORKDIR /usr/local/cuda-10.2/samples/0_Simple/matrixMul

#RUN make

#ENTRYPOINT ["/usr/local/cuda-10.2/samples/0_Simple/matrixMul/matrixMul"]
