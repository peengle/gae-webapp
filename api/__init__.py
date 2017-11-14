# -*- coding: utf-8 -*-

from webapp2_extras.routes import PathPrefixRoute
import spiner
import webapp2

class DocHandler(spiner.handlers.jsonapi.Handler):
    def get(self):
        self._send({
            '/v1': {
                },
            })

ROUTES = [
    PathPrefixRoute(
        '/api',
        [
            webapp2.Route(
                r'/',
                handler=DocHandler
                )
        ])
    ]

app = webapp2.WSGIApplication(
    ROUTES,
    debug=spiner.config.is_debug_mode())
