from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_superadmin import Admin

app = Flask(__name__)

# Basic Flask configuration
app.config.from_pyfile('config.py')

# Flask-SQLAlchemy configuration
db = SQLAlchemy(app)

# Flask-Login configuration
login_manager = LoginManager()
login_manager.init_app(app)

import trackapp.views
import trackapp.models
import trackapp.forms

# Flask SuperAdmin
admin = Admin(app)

admin.register(models.Location, session=db.session)
admin.register(models.User, session=db.session)
admin.register(models.Address, session=db.session)
admin.register(models.Zone, session=db.session)
admin.register(models.Anchor, session=db.session)
admin.register(models.Route, session=db.session)
admin.register(models.Sesh, session=db.session)
admin.register(models.Climb, session=db.session)
