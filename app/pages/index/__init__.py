# -*- coding: utf-8 -*-

from spiner import view
from webapp2 import RequestHandler


class Handler(RequestHandler):
    def get(self):
        template = view.get_template('app/pages/index/tpl.html')
        self.response.write(template.render())
