N8N_VOLUME=jhal_n8n_data
TRAEFIK_VOLUME=jhal_traefik_data
BACKUP_DIR=.
N8N_BACKUP=$(BACKUP_DIR)/$(N8N_VOLUME)_backup.tar.gz
TRAEFIK_BACKUP=$(BACKUP_DIR)/$(TRAEFIK_VOLUME)_backup.tar.gz

.PHONY: import-n8n import-traefik import-all

run:
	docker compose up -d

stop:
	docker compose down

import-n8n:
	docker volume create my-n8n_n8n_data
	docker run --rm -v my-n8n_n8n_data:/data -v $(PWD):/backup busybox \
		tar xzf /backup/$(notdir $(N8N_BACKUP)) -C /data

import-traefik:
	docker volume create my-n8n_traefik_data
	docker run --rm -v my-n8n_traefik_data:/data -v $(PWD):/backup busybox \
		tar xzf /backup/$(notdir $(TRAEFIK_BACKUP)) -C /data

import-all: import-n8n import-traefik


