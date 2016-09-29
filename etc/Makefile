default:
	cp .env.example .env
	@echo "Now replace the example values in .env with the good ones"

install:
	source .env

run:
	docker-compose -f ./compose/$(env).yml up
