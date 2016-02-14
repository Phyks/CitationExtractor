#!/usr/bin/env python3
import bottle
import main
import os
# Change working directory so relative paths (and template lookup) work again
os.chdir(os.path.dirname(__file__))

# ... build or import your bottle application here ...
# Do NOT use bottle.run() with mod_wsgi
application = bottle.default_app()
