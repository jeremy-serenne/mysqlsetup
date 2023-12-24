DOCKER_COMPOSER	=	docker-compose

start:
	$(DOCKER_COMPOSER) up -d --remove-orphans --no-recreate

down:
	$(DOCKER_COMPOSER) down

restart:
	$(DOCKER_COMPOSER) restart mysql-db

mount-fix:
	sudo mkdir /sys/fs/cgroup/systemd
	sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd

.PHONY: start down restart mount-fix