from flask import render_template, session, url_for, redirect

from trackapp import app, db

from .models import Location, User, Address, Zone, Anchor, Route, Sesh, Climb

@app.route('/')
@app.route('/index/')
def index():
    user = User.query.get(1)
    climb = Climb.query.get(3)
    route = Route.query.get(2)
    location = Location.query.get(1)
    return render_template('index.html',
                            user = user,
                            climb = climb,
                            route = route,
                            location = location)

@app.route('/location/<int:location_id>/')
def location_home(location_id):
    user = User.query.get(1)
    location = Location.query.get(location_id)
    address = Address.query.filter_by(location_id=location_id).first()
    return render_template('location_home.html',
                            user = user,
                            location = location,
                            address = address)

@app.route('/user/<int:user_id>/')
def user_home(user_id):
    user = User.query.get(user_id)
    return render_template('user_home.html',
                            user = user)

@app.route('/route/<int:route_id>/')
def route_home(route_id):
    route = Route.query.get(route_id)
    return render_template('route_home.html',
                            route = route)
