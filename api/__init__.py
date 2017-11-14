# -*- coding: utf-8 -*-

from webapp2_extras.routes import PathPrefixRoute
import spiner
import webapp2
import v1

class DocHandler(spiner.handlers.jsonapi.Handler):
    def get(self):
        self._send({
            '/v1': {
                },
            })

_routes = [
    webapp2.Route(
        r'/',
        handler=DocHandler
        )
    ]
_routes.extend(v1.ROUTES)

app = webapp2.WSGIApplication(
    [
        PathPrefixRoute('/api', _routes)
    ],
    debug=spiner.config.is_debug_mode())
