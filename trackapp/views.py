from flask import render_template

from trackapp import app, db

from .models import Location, User, Address, Zone, Anchor, Route

@app.route('/')
@app.route('/index/')
def index():
    user = User.query.get(1)
    climbs = Climb.query.all()
    locations = Location.query.order_by(Location.name).limit(5).all()
    return render_template('index.html',
                            user = user,
                            climbs = climbs,
                            locations = locations)

@app.route('/location/<int:location_id>/')
def location_home(location_id):
    user = User.query.get(1)
    location = Location.query.get(location_id)
    address = Address.query.filter_by(location_id=location_id).first()
    return render_template('location_home.html',
                            user = user,
                            location = location,
                            address = address)
