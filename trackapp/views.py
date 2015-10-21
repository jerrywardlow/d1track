from flask import render_template

from trackapp import app, db

from .models import Location, User, Address, Zone, Anchor, Route

@app.route('/')
@app.route('/index/')
def index():
    return "Everything seems fine..."

@app.route('/location/<int:location_id>/')
def location_home(location_id):
    user = User.query.get(1)
    location = Location.query.get(location_id)
    address = Address.query.filter_by(location_id=location_id).first()
    return render_template('location_home.html',
                            user = user,
                            location = location,
                            address = address)
