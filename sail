#!/usr/bin/env bash

if ! docker info > /dev/null 2>&1; then
    echo -e "${WHITE}Docker is not running.${NC}" >&2

    exit 1
fi

if [ -f ./.env ]; then
    source ./.env
fi

if [ $# -gt 0 ]; then
    if [ "$1" == "prod" ]; then
        shift 1
        docker-compose -f docker-compose.yml "$@"
    else
        docker-compose "$@"
    fi
else
    docker-compose ps
fi
