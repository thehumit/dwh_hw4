#!/bin/bash

# Bash script to clone the Apache Superset repository and run Docker Compose

# Step 1: Clone the Apache Superset repository
echo "Cloning the Apache Superset repository..."
git clone https://github.com/apache/superset.git

# Check if git clone was successful
if [ $? -ne 0 ]; then
    echo "Failed to clone the repository. Exiting."
    exit 1
fi

# Change directory to the cloned repository
cd superset

# Step 2: Pull Docker images using docker-compose-non-dev.yml
echo "Pulling Docker images..."
docker compose -f docker-compose-non-dev.yml pull

# Check if Docker pull was successful
if [ $? -ne 0 ]; then
    echo "Failed to pull Docker images. Exiting."
    exit 1
fi

# Step 3: Start up the Docker containers
echo "Starting up Docker containers..."
docker compose -f docker-compose-non-dev.yml up

# End of script
