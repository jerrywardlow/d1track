from flask_wtf import Form
from wtforms import BooleanField, StringField, FloatField, TextAreaField, SubmitField
from wtforms.validators import Length, InputRequired, Email, Optional

class RegistrationForm(Form):
    username = StringField('Username', validators=[InputRequired('Please choose a username'), Length(min=4, max=30)])
    email = StringField('Email Address', validators=[InputRequired('Please enter a valid e-mail address'), Email('Please enter a valid e-mail address')])
    accept_rules = BooleanField('I accept the site rules', validators=[InputRequired()])
    submit = SubmitField('Submit')

class UserProfileForm(Form):
    username = StringField('Username', validators=[InputRequired('Please choose a username'), Length(min=4, max=30)])
    email = StringField('Email Address', validators=[InputRequired('Please enter a valid e-mail address'), Email('Please enter a valid e-mail address')])
    fullname = StringField()
    gender = StringField('Gender', validators=[Optional()])
    height = FloatField() # Need to consider how data is stored to create validator. Centimeters? Inches?
    wingspan = FloatField() # Same considerations as 'height'
    shoesize = FloatField() # Max of Euro 49/American 16?
    # homegym
    blurb = TextAreaField() # Maximum length?
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
