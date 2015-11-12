from flask.ext.wtf import Form
from wtforms import BooleanField, StringField
from wtforms.validators import Length, InputRequired, Email

class RegistrationForm(Form):
    username = StringField('Username', validators=[InputRequired('Please choose a username'), Length(min=4, max=30)])
    email = StringField('Email Address', validators=[InputRequired('Please enter a valid e-mail address'), Email('Please enter a valid e-mail address')])
    accept_rules = BooleanField('I accept the site rules', validators=[InputRequired()])
