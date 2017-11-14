# -*- coding: utf-8 -*-

import pages
import spiner
import webapp2

ROUTES = [
        webapp2.Route(
            r'/',
            handler=pages.index.Handler
            )
        ]

app = webapp2.WSGIApplication(
    ROUTES,
    debug=spiner.config.is_debug_mode())
