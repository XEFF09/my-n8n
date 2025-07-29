run:
	docker compose up -d

stop:
	docker compose down

create-vol:
	docker volume create jhal_n8n_data
	docker volume create jhal_traefik_data

