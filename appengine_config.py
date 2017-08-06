"""
`appengine_config.py` is automatically loaded when Google App Engine
starts a new instance of your application. This runs before any
WSGI applications specified in app.yaml are loaded.
"""

from google.appengine.ext import vendor
from json import JSONEncoder
import os

# Third-party libraries are stored in "lib", vendoring will make
# sure that they are importable by the application.
vendor.add('lib')

if os.environ.get('SERVER_SOFTWARE', '').startswith('Development'):
    remoteapi_CUSTOM_ENVIRONMENT_AUTHENTICATION = (
        'REMOTE_ADDR', ['127.0.0.1'])


# monkey patch default json encoder to invoke to_dict method
# when trying to serialize object
def _default(self, obj):
    return getattr(obj.__class__, "to_dict", _default.default)(obj)

_default.default = JSONEncoder().default
JSONEncoder.default = _default


# https://cloud.google.com/appengine/docs/standard/python/tools/appstats
def webapp_add_wsgi_middleware(app):
    from google.appengine.ext.appstats import recording
    app = recording.appstats_wsgi_middleware(app)
    return app
