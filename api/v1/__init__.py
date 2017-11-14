# -*- coding: utf-8 -*-

from webapp2_extras.routes import PathPrefixRoute
import spiner
import webapp2

class DocHandler(spiner.handlers.jsonapi.Handler):
    def get(self):
        self._send({
            '/hello': {
                },
            })

ROUTES = [
    PathPrefixRoute(
        '/v1', [
            webapp2.Route(r'', handler=DocHandler)
        ])
    ]
