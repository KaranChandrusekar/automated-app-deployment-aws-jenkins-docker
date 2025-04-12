#!/bin/bash
ENV=$1
source .env.docker
docker login -u $docker_user -p $docker_pass

echo "Deploying the image into Dockerhub repo..."

if [ "$ENV" == "prod" ]; then
    docker tag react_e-commerce_app:v1 karanchandrusekar/react_e-commerce_app-private:v1
    docker push karanchandrusekar/react_e-commerce_app-private:v1  # Push to private repo
else
    docker tag react_e-commerce_app:v1 karanchandrusekar/react_e-commerce:v1
    docker push karanchandrusekar/react_e-commerce:v1  # Push to public repo
fi
echo "Image deployed successfully to Dockerhub repo."
