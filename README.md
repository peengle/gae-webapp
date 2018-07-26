# GAE SKELETON

Google App Engine is a web framework and cloud computing platform for 
developing and hosting web applications in Google-managed data centers

Google App Engine Standard Environment offers a lot of build-in features that
helps in writing web application. 

The skeleton project is proposing structure that can be use to serve: website,
rest api, cms or all of them at once from single project. It comes as well
with some helpful commands and patterns for creating separate config for 
production, staging and local environments

To create new app just clone this repository open Makefile and change 
`APP_ID`, `SDK_PATH` to your own and run:

```
$ ./bin/init-new-project
```

which will do following steps:

```
rm .git
git init
git commit --allow-empty -m 'Initial commit'
git add .
git commit -m 'Initial project structure'
cp local.yaml.example local.yaml
make build
make run
```

The project structure is very simple to extend, like you can see on below
folder structure every www page, api endpoint is kept in separate namespace

```
.
├── Makefile
├── README.md
├── api
│   └── __init__.py
├── app.yaml
├── appengine_config.py
├── dev.yaml
├── local.yaml.example
├── release
├── requirements.txt
├── unittest
├── upload
│   └── __init__.py
└── www
    ├── Makefile
    ├── __init__.py
    ├── package.json
    ├── pages
    │   ├── __init__.py
    │   └── index
    │       ├── __init__.py
    │       ├── style.scss
    │       └── tpl.html
    └── resources
        ├── img
        │   └── logo.svg
        ├── layouts
        │   └── default
        │       ├── style.scss
        │       └── tpl.html
        └── scss
            ├── _mixins.scss
            ├── _variables.scss
            └── style.scss
```
