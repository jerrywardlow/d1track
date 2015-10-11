from . import db

from datetime import datetime

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String, unique=True)
    email = db.Column(db.String, unique=True)
    fullname = db.Column(db.String)
    usertype = db.Column(db.Integer, default=1)
    password = db.Column(db.String)
    gender = db.Column(db.String)
    height = db.Column(db.Float(precision=2)) # Centimeters
    wingspan = db.Column(db.Float(precision=2)) # Centimeters
    shoesize = db.Column(db.Float(precision=1)) # European sizing
    photo = db.Column(db.String)
    active = db.Column(db.Boolean, default=True)
    created_on = db.Column(db.DateTime, default=datetime.now)
    # Need to add homegym_id relationship to Location

class Address(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    address1 = db.Column(db.String)
    address2 = db.Column(db.String)
    city = db.Column(db.String)
    state = db.Column(db.String)
    zipcode = db.Column(db.Integer)
    phone = db.Column(db.String) # Can expand to a phone table for multiples
    email = db.Column(db.String) # Can expand to email table for multiples
    website = db.Column(db.String)
    location_id = db.Column(db.Integer, ForeignKey('locations.id'))
