#sudo docker build  -t "face_recognition_api_1th:v0.1" .

#sudo docker build --platform linux/amd64 -t face_recognition_api_1th:v0.1_mult .


#sudo docker buildx build --platform=linux/arm64,linux/amd64/v2 -t angelocarlotto/face_recognition_api_1th:latest_mult . --load 
#sudo docker buildx build --platform=linux/amd64 -t angelocarlotto/face_recognition_api_1th:latest_amd64 . --push
#sudo docker buildx build --platform=linux/arm64 -t angelocarlotto/face_recognition_api_1th:latest_arm64 . --push
# Use the official Ubuntu base image
#FROM ubuntu:latest
FROM ubuntu


# Update the package list and install dependencies
RUN apt-get update && apt-get install -y -q --allow-unauthenticated \
    build-essential \
    cmake \
    git \
    git-all\
    wget \
    curl \
    unzip \
    libopenblas-dev \
    liblapack-dev \
    libx11-dev \
    libgtk-3-dev \
    libboost-python-dev \
    python3 \
    python3-pip \
    python3-dev \
    python3.12-venv

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*