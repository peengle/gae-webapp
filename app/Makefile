SHELL := /bin/bash
PATH := ./node_modules/.bin:$(PATH)

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
		find ../dist/app -name "*.js" -delete
		find ../dist/app -name "*.css" -delete

watch:
		onchange 'pages/**/**/*.scss' -- make build-css &
		onchange 'resource/**/**/*.scss' -- make build-css &
		onchange 'pages/**/**/*.js' -- make build-js &
		onchange 'resource/img/**' -- make build-images

build:
		npm install
		make build-css
		make build-js
		make build-images

build-css:
		stylelint 'resources/**/**/*.scss' --syntax scss
		stylelint 'pages/**/**/*.scss' --syntax scss
		node-sass --output-style compressed -o ../dist/app resources/scss
		postcss -u autoprefixer -r ../dist/app/*.css

build-js:
		uglifyjs-folder pages -o ../dist/app/script.js
		uglifyjs node_modules/jquery/dist/jquery.min.js -o ../dist/app/vendor.js

build-images:
		imagemin resources/img resources/img/** ../dist/app -p
