from . import db

from datetime import datetime

class Location(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String)
    photo = db.Column(db.String)

    def __repr__(self):
        return '<Location %r' % (self.name)

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
    homegym_id = db.Column(db.Integer, db.ForeignKey('location.id'))
    homegym = db.relationship(Location)
    photo = db.Column(db.String)
    active = db.Column(db.Boolean, default=True)
    created_on = db.Column(db.DateTime, default=datetime.now)


    def __repr__(self):
        return '<User %r>' % (self.username)

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
    location_id = db.Column(db.Integer, db.ForeignKey('location.id'))
    location = db.relationship(Location)

    def __repr__(self):
        return '<Address ID: %r>' % (self.id)

class Zone(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String)
    photo = db.Column(db.String)
    location_id = db.Column(db.Integer, db.ForeignKey('location.id'))
    location = db.relationship(Location)

    def __repr__(self):
        return '<Zone %r>' % (self.name)

class Anchor(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String)
    zone_id = db.Column(db.Integer, db.ForeignKey('zone.id'))
    zone = db.relationship(Zone)
    # style_id = db.Column(db.Integer)
    # draw_id = db.Column(db.Integer)
    # rope_id = db.Column(db.Integer)

    def __repr__(self):
        return '<Anchor %r>' % (self.name)

class Route(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String)
    anchor_id = db.Column(db.Integer, db.ForeignKey('anchor.id'))
    anchor = db.relationship(Anchor)
    location_id = db.Column(db.Integer, db.ForeignKey('location.id'))
    location = db.relationship(Location)
    defined_grade = db.Column(db.Integer)
    length = db.Column(db.Integer)
    # setter_id = db.Column(db.Integer)
    created_on = db.Column(db.DateTime, default = datetime.now)
    active = db.Column(db.Boolean, default = True)
    last_update = db.Column(db.DateTime, default = datetime.now, onupdate = datetime.now)
    color = db.Column(db.String)
    photo = db.Column(db.String)

    def __repr__(self):
        return '<Route: %r>' % (self.name)

class Sesh(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    user = db.relationship(User)
    location_id = db.Column(db.Integer, db.ForeignKey('location.id'))
    location = db.relationship(Location)
    # climbed_with = db.Column(db.Integer)
    user_rating = db.Column(db.Integer)
    photo = db.Column(db.String)

    def __repr__(self):
        return '<Sesh: %r>' % (self.id)

class Climb(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'))
    user = db.relationship(User)
    sesh_id = db.Column(db.Integer, db.ForeignKey('seshs.id'))
    sesh = db.relationship(Sesh)
    route_id = db.Column(db.Integer, db.ForeignKey('routes.id'))
    route = db.relationship(Route)
    success = db.Column(db.Boolean)
    user_grade = db.Column(db.Integer)
    user_rating = db.Column(db.Integer)
    comment = db.Column(db.String)

    def __repr__(self):
        return '<Climb %r:>' % (self.id)
