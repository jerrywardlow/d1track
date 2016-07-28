from trackapp import db

from trackapp.models import Location, User, Address, Zone, Anchor, Route, Sesh, Climb

db.create_all()

# Create Locations

test_loc1 = Location(
    name="Test Gym One",
    tagline="An Awesome Gym For Application Testing!",
    description="North America's largest web application testing rock climbing gym! With over 500 routes and thousands of bugs, this gym is perfect for the developer looking to debug their Flask web application!",
    photo="http://i.imgur.com/WnYcSJC.png"
)
db.session.add(test_loc1)
db.session.commit()

test_loc2 = Location(
    name="The Send Castle",
    tagline="Castles in the Send",
    description="Puns await you as you challenge these challenging challenges of challenge! Does the word challenge look weird to you now???",
    photo="http://i.imgur.com/Msl4RI3.png"
)
db.session.add(test_loc2)
db.session.commit()


# Create Users

user1 = User(
    username="hambone",
    email="hambone@example.com",
    fullname="Ham Bone",
    usertype=2,
    password="hambonepassword",
    gender="Male",
    height=180,
    wingspan=177,
    shoesize=42.5,
    homegym_id=1,
    blurb="I'm just really into ham these days!",
    photo="http://i.imgur.com/2nf4xlf.jpg",
    active=True
)
db.session.add(user1)
db.session.commit()

user2 = User(
    username="testkitchen",
    email="testkitchen@example.com",
    fullname="T.K. Lewis",
    usertype=1,
    password="passwordstring",
    gender="Female",
    height=175,
    wingspan=176,
    shoesize=36.0,
    homegym_id=2,
    blurb="RECIPE UPLOADED SUCCESSFULLY",
    photo="http://i.imgur.com/ZPYTNU5.jpg",
    active=True
)
db.session.add(user2)
db.session.commit()


# Create Addresses

add1 = Address(
    address1="225 Fake Zone",
    address2="",
    city="Puerto Sancho",
    state="AK",
    zipcode="98654",
    phone="789-555-2320",
    email="testgymone@example.com",
    website="http://www.testgymone.com/gym",
    location_id=1
)
db.session.add(add1)
db.session.commit()

add2 = Address(
        address1="12548 Street Sandwich",
        address2="",
        city="Doodle",
        state="OK",
        zipcode="00654",
        phone="555-555-2320",
        email="thesendcastle@example.com",
        website="http://www.sendcastle.com/home",
        location_id=2
)
db.session.add(add2)
db.session.commit()


# Create Zones

zone1 = Zone(
    name="Test Zone Alpha",
    description="An epic mud field, true senders only!",
    photo="http://i.imgur.com/M7BUXi0.jpg",
    location_id=1
)
db.session.add(zone1)
db.session.commit()

zone2 = Zone(
    name="Test Zone Burger",
    description="Seventy vertical feet of AMERICAN BEEF!",
    photo="http://i.imgur.com/7Nmaxlv.jpg",
    location_id=1
)
db.session.add(zone2)
db.session.commit()

zone3 = Zone(
    name="The Old Bridge",
    description="Literally an old bridge.",
    photo="http://i.imgur.com/eFirR5X.jpg",
    location_id=2
)
db.session.add(zone3)
db.session.commit()

zone4 = Zone(
    name="Garage Box",
    description="Some guy's garage, use at your own risk...",
    photo="http://i.imgur.com/YFRAh9n.jpg",
    location_id=2
)
db.session.add(zone4)
db.session.commit()


# Create Anchors

anch1 = Anchor(
    name="TG Alpha A1",
    description="Test Gym Zone Alpha Anchor 1",
    zone_id=1
)
db.session.add(anch1)
db.session.commit()

anch2 = Anchor(
    name="TG Burger A1",
    description="Test Gym Zone Burger Anchor 1",
    zone_id=2
)
db.session.add(anch2)
db.session.commit()

anch3 = Anchor(
    name="SC Bridge A1",
    description="Send Castle Zone Bridge Anchor 1",
    zone_id=3
)
db.session.add(anch3)
db.session.commit()

anch4 = Anchor(
    name="SC Garage A1",
    description="Send Castle Zone Garage Anchor 1",
    zone_id=4
)
db.session.add(anch4)
db.session.commit()


# Create Routes

route1 = Route(
    name="Get Well Soon",
    description="An epic of epic proportions. Wear gloves.",
    anchor_id=1,
    defined_grade=1200,
    color="Blue",
    photo="http://i.imgur.com/PafU8fu.png"
)
db.session.add(route1)
db.session.commit()

route2 = Route(
    name="Party Shuffle",
    description="A boring slog up endless jugs. Our setters really phoned it in on this one.",
    anchor_id=2,
    defined_grade=1800,
    color="Pink",
    photo="http://i.imgur.com/3UwMAsC.jpg"
)
db.session.add(route2)
db.session.commit()

route3 = Route(
    name="Ball Pit",
    description="Honestly, this is just a pit full of balls.",
    anchor_id=3,
    defined_grade=900,
    color="Multi",
    photo="http://i.imgur.com/mPbplJT.jpg"
)
db.session.add(route3)
db.session.commit()

route4 = Route(
    name="Parking Lot",
    description="Some like to describe the famous Smith Rock Testpiece 'To Bolt Or Not To Be' as a 'Vertical Parking Lot'. This is just a normal horizontal parking lot. Oops.",
    anchor_id=4,
    defined_grade=100,
    color="Asphalt",
    photo="http://i.imgur.com/5rv0TDL.jpg"
)
db.session.add(route4)
db.session.commit()


# Create Sesh

sesh1 = Sesh(
    user_id=1,
    location_id=1,
    user_rating=2,
    comment="This was one of my worst days of the year! Great work, said no one."
)
db.session.add(sesh1)
db.session.commit()

# Create Climb

climb1 = Climb(
    sesh_id=1,
    route_id=2,
    success=True,
    user_grade=2,
    user_rating=1,
    comment="The description for this route was very accurate!"
)
db.session.add(climb1)
db.session.commit()
