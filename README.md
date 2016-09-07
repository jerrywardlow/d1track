# Rock Climbing Tracker

### About

A work in progress, this is a simple Flask based web application for tracking rock climbing both at indoor gyms and outside. Data is modeled with SQLAlchemy and stored in a PostgreSQL database. Templates are rendered with Jinja2 and delivered with WSGI and Gunicorn.

### Using this project

An included Vagrantfile will provision an application server and a dedicated PostgreSQL server. The Flask app is served by Apache and mod-wsgi. In addition, Docker Compose can be used to build a Docker container for the application and a supporting PostgreSQL container, serving the application on port 5000.
