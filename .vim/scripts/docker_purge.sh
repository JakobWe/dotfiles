#!/bin/bash
docker ps -q | xargs docker kill
docker system prune -f
