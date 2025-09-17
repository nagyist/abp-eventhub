docker network create eventhub-network
docker-compose -f infrastructure/posgres.yml -f infrastructure/redis.yml up -d --remove-orphans