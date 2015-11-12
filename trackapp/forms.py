from flask.ext.wtf import Form
from wtforms import BooleanField, StringField
from wtforms.validators import Length, InputRequired

class RegistrationForm(Form):
    username = StringField('Username', validators=[Length(min=4, max=30)])
    email = StringField('Email Address', validators=[Length(min=6, max=35)])
    accept_rules = BooleanField('I accept the site rules', validators=[InputRequired()])
