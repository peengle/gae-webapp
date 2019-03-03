# Overwrite below const when needed
APP_ID=webapp
SDK_PATH=~/google-cloud-sdk
PORT=8880
ADMIN_PORT=8881
TEST_PATH=tests
STORAGE_PATH=.storage
HOST=localhost


help:
		@echo "OPTIONS:"
		@echo '    run'
		@echo '        Run service on your local machine: make run <port> <appid>'
		@echo '    install'
		@echo '        Build project dependencies.'
		@echo '    release-dev'
		@echo '        Release project to fitg-engine-dev env.'
		@echo '    release-prod'
		@echo '        Release project to fitg-engine env.'
		@echo '    clean-pyc'
		@echo '        Remove all *.pyc files from project'
		@echo '    test'
		@echo '        Run tests eg: make test TEST_PATH=tests/engine'

test:
		./unittest $(SDK_PATH) --test-path $(TEST_PATH)

clean-pyc:
		find . -name "*.pyc" -type f -delete

run:
		dev_appserver.py . -A $(APP_ID) --storage_path=$(STORAGE_PATH) --port $(PORT) --admin_port $(ADMIN_PORT) --host $(HOST) &
		make -C www watch

tree:
		tree -I 'node_modules|lib|dist|bin|upload|unittest|*.png|*.svg|*.pyc|*.lock'

build:
		make install-pip-requirements
		make build-www

build-www:
		make -C www build

install-pip-requirements:
		./bin/pipinstall

release-dev:
		./bin/release $(APP_ID)

release-prod:
		./bin/release $(APP_ID) --prod
