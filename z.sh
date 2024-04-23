#!/bin/bash

# Function to check if Docker is installed
check_docker() {
    if ! [ -x "$(command -v docker)" ]; then
        echo "Error: Docker is not installed." >&2
        exit 1
    fi
}

# Function to check if there are running containers
check_running_containers() {
    local running_containers=$(docker ps -aq)
    if [ -n "$running_containers" ]; then
        echo "Stopping and removing running containers..."
        docker stop $running_containers >/dev/null 2>&1
        docker rm $running_containers >/dev/null 2>&1
    fi
}

# Function to remove all Docker images
remove_all_images() {
    echo "Removing all Docker images..."
    docker rmi $(docker images -q) >/dev/null 2>&1
}

# Main function
main() {
    # check_docker
    check_running_containers
    remove_all_images
    echo "Cleanup complete!"
}

# Run the main function
main
