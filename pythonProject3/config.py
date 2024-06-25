from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_login import LoginManager

db = SQLAlchemy()
migrate = Migrate()
login_manager = LoginManager()

class Config:
    SECRET_KEY = b'f3aa0ebdcc174d0c29d0340243d3da2b4e9d7b63f1acc158af35fd6169f74dd8'
    SQLALCHEMY_DATABASE_URI = 'sqlite:///database.db'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    UPLOAD_FOLDER = 'static/images'
    ALLOWED_EXTENSIONS = {'jpg', 'jpeg', 'png', 'gif'}