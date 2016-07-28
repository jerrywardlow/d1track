# For use with Gunicorn (`gunicorn -b 0.0.0.0:5000 wsgi:app`)
from trackapp import app

if __name__ == "__main__":
    app.run(host = '0.0.0.0')
