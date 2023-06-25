# Inicia o docker
docker:
	sudo docker-compose up

# Necessario quando precisar rodar algum comando no servidor
bash:
	sudo docker-compose exec rails /bin/bash

# Quando for preciso usar o byebug usar esse comando com o parametro container=<NOME-CONTAINER>
debug:
# Para sair da tela deste comando, CTRL + P CTRL + Q
ifeq ($(container),)
	echo "Para container padrão empresta-e-vende"
	sudo docker attach empresta-e-vende
else
	echo "Para container customizado"
	sudo docker attach $(container)
endif

# Quando for necessário reiniciar a aplicação sem derrubar todos os containers
restart:
ifeq ($(container),)
	echo "Para container padrão empresta-e-vende"
	sudo rm tmp/pids/server.pid
	sudo docker restart empresta-e-vende
	sudo docker-compose up
else
	echo "Para container customizado"
	sudo rm tmp/pids/server.pid
	sudo docker restart $(container)
	sudo docker-compose up
endif
