# -*- coding: utf-8 -*-
# replace HELLOAPP with your own app name configured in Makefile APP_ID
from copy import deepcopy
import logging
import os

_ENV = {
      'DEBUG': '0',
      'ENVIRONMENT': 'production',
      'GCS_STORAGE_URL': 'https://storage.googleapis.com/{path}',
      'SESSION_EXPIRE': 600,
      'SESSION_SECRET_KEY': '*** put your own secret key here ***',
    }

HELLOAPP = deepcopy(_ENV)
HELLOAPP.update({
    })

HELLOAPP_DEV = deepcopy(HELLOAPP)
HELLOAPP_DEV.update({
      'DEBUG': '1',
      'ENVIRONMENT': 'development',
    })

try:
    if (os.environ['APPLICATION_ID'] == 'testbed-test' or
            os.environ['SERVER_SOFTWARE'].startswith('Dev')):
        import local
        HELLOAPP_DEV.update(local.ENV)
        TESTBED_TEST = HELLOAPP_DEV
except Exception as e:
    logging.info(e)
