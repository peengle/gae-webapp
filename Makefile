# Overwrite below const when needed
APP_ID=helloapp
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

build:
		make install-pip-requirements
		make -C www build

install-pip-requirements:
		pip install -r requirements.txt -t lib --upgrade

release-dev:
		./bin/release $(APP_ID)

release-prod:
		./bin/release $(APP_ID) --prod
