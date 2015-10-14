from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy
from flask.ext.superadmin import Admin

app = Flask(__name__, instance_relative_config=True)

app.config.from_object('config')
app.config.from_pyfile('config.py')

db = SQLAlchemy(app)

import trackapp.views
import trackapp.models
import trackapp.forms

admin = Admin(app)

admin.register(models.Location, session=db.session)
admin.register(models.User, session=db.session)
admin.register(models.Address, session=db.session)
admin.register(models.Zone, session=db.session)
admin.register(models.Anchor, session=db.session)
admin.register(models.Route, session=db.session)
admin.register(models.Sesh, session=db.session)
admin.register(models.Climb, session=db.session)
