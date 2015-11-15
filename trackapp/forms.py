from flask.ext.wtf import Form
from wtforms import BooleanField, StringField, FloatField, TextAreaField
from wtforms.validators import Length, InputRequired, Email

class RegistrationForm(Form):
    username = StringField('Username', validators=[InputRequired('Please choose a username'), Length(min=4, max=30)])
    email = StringField('Email Address', validators=[InputRequired('Please enter a valid e-mail address'), Email('Please enter a valid e-mail address')])
    accept_rules = BooleanField('I accept the site rules', validators=[InputRequired()])

class UserProfileForm(Form):
    username = StringField()
    email = StringField()
    fullname = StringField()
    gender = StringField()
    height = FloatField()
    wingspan = FloatField()
    shoesize = FloatField()
    # homegym
    blurb = TextAreaField()
    photo = StringField() # This should actually be an Imgur Uploadr

class AddressForm(Form):
    address1 = StringField()
    address2 = StringField()
    city = StringField()
    state = StringField()
    zipcode = StringField()
    phone = StringField()
    email = StringField()
    website = StringField()

class ClimbForm(Form):
    # route = selection?
    success = BooleanField()
    # user_grade = selection?
    # user_rating = selection?
    comment = StringField()
