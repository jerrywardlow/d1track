from flask import render_template, session, url_for, redirect, request, abort

from trackapp import app, db, login_manager

from .models import Location, User, Address, Zone, Anchor, Route, Sesh, Climb

from .forms import RegistrationForm, UserProfileForm, AddressForm, ClimbForm

@app.route('/')
@app.route('/index/')
def index():
    user = User.query.get(1)
    climb = Climb.query.get(1)
    route = Route.query.get(1)
    location = Location.query.get(1)
    return render_template('index.html',
                            user = user,
                            climb = climb,
                            route = route,
                            location = location)

@app.route('/login/', methods=['GET', 'POST'])
def login():
    user = User.query.get(1)
    form = RegistrationForm()
    return render_template('login.html',
                            user = user,
                            form = form)

@app.route('/register/', methods=['GET', 'POST'])
def register():
    if request.method == 'GET':
        return render_template(register.html)
    elif request.method == 'POST':
        pass
    else:
        abort(405)

@app.route('/location/<int:location_id>/')
def location_home(location_id):
    user = User.query.get(1)
    location = Location.query.get(location_id)
    if not location:
        abort(404)
    address = Address.query.filter_by(location_id=location_id).first()
    return render_template('location_home.html',
                            user = user,
                            location = location,
                            address = address)

@app.route('/user/<int:user_id>/')
def user_home(user_id):
    user = User.query.get(user_id)
    if not user:
        abort(404)
    return render_template('user_home.html',
                            user = user)

@app.route('/route/<int:route_id>/')
def route_home(route_id):
    user = User.query.get(1)
    route = Route.query.get(route_id)
    if not route:
        abort(404)
    return render_template('route_home.html',
                            user = user,
                            route = route)

@app.route('/climb/<int:climb_id>/')
def climb_home(climb_id):
    user = User.query.get(1)
    climb = Climb.query.get(climb_id)
    if not climb:
        abort(404)
    return render_template('climb_home.html',
                            user = user,
                            climb = climb)
