APP_ID=gaeapp
SDK_PATH=~/google-cloud-sdk
TEST_PATH=tests
STORAGE_PATH=.storage
HOST=localhost
PORT=9990
ADMIN_PORT=9991


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
		dev_appserver.py . -A $(APP_ID) --storage_path=$(STORAGE_PATH) --port $(PORT) --admin_port $(ADMIN_PORT) --host $(HOST)

build:
		make install-pip-requirements
		make -C app build

install-pip-requirements:
		pip install -r requirements.txt -t lib --upgrade

release-dev:
		./bin/release

release-prod:
		./bin/release --prod
