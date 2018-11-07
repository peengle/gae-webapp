SHELL := /bin/bash
PATH := ./node_modules/.bin:$(PATH)
LAYOUT=default
NAME=www

help:
		@echo "OPTIONS:"
		@echo '    clean'
		@echo '        Cleanup build workspace'
		@echo '    watch'
		@echo '        Watch scss, js & images files for change, and run build on change'
		@echo '    build'
		@echo '        Build all css, js, img files from resources'
		@echo '    build-css'
		@echo '        Build css files from resources'
		@echo '    build-js'
		@echo '        Build js files from resources'
		@echo '    build-images'
		@echo '        Build images files from resources'

clean:
		find ../dist/www -name "*.js" -delete
		find ../dist/www -name "*.css" -delete

watch:
		onchange 'pages/**/**/*.scss' -- make build-css &
		onchange 'resources/**/**/*.scss' -- make build-css &
		onchange 'pages/**/**/*.js' -- make build-js &
		onchange 'resources/img/**' -- make build-images

build:
		yarn install
		make build-css
		make build-js
		make build-images

build-css:
		stylelint 'resources/**/**/*.scss' --syntax scss
		stylelint 'pages/**/**/*.scss' --syntax scss
		node-sass --output-style compressed -o ../dist/$(NAME) resources/layouts/$(LAYOUT)
		postcss -u autoprefixer -r ../dist/$(NAME)/*.css

build-js:
		uglifyjs-folder pages -o ../dist/$(NAME)/script.js
		uglifyjs node_modules/jquery/dist/jquery.min.js -o ../dist/$(NAME)/vendor.js

build-images:
		imagemin resources/img resources/img/** ../dist/$(NAME) -p
