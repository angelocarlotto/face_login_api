#sudo docker build  -t "angelocarlotto/face_recognition_api:latest" .
#docker push angelocarlotto/face_recognition_api:latest
#docker run --rm  -p 5001:5000  angelocarlotto/face_recognition_api:latest_arm64

#sudo docker buildx build --platform=linux/arm64,linux/amd64 -t angelocarlotto/face_recognition_api:latest_mult . --load
#sudo docker buildx build --platform=linux/amd64 -t angelocarlotto/face_recognition_api:latest_amd . --push
#sudo docker buildx build --platform=linux/arm64 -t angelocarlotto/face_recognition_api:latest_arm64 . --push
#docker push angelocarlotto/face_recognition_api:latest_amd64
# Use the official Ubuntu base image
#FROM angelocarlotto/face_recognition_api_2nd:latest_amd64
FROM angelocarlotto/face_recognition_api_2nd:latest_arm64

# Prevents prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive
ENV FLASK_APP=api/main.py
ENV FLASK_DEBUG=1


EXPOSE 5000

#ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache

#RUN git clone https://github.com/angelocarlotto/face_recognition_api.git

COPY . .

#COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

#RUN mkdir enviroments
RUN chmod -R 777 enviroments
# Set the default command to run the application

#CMD [".", "venv/bin/activate", "&&", "flask", "run", "--host=0.0.0.0"]
ENTRYPOINT ["entrypoint.sh"]