import os

class Config:
    MYSQL_HOST = 'localhost'
    MYSQL_USER = 'root'
    MYSQL_PASSWORD = 'password' # Replace with your MySQL password
    MYSQL_DB = 'spdexpress'
    MYSQL_CURSORCLASS = 'DictCursor'

    # Session Configuration
    SESSION_TYPE = 'filesystem'
    SECRET_KEY = os.getenv('SECRET_KEY', 'supersecretkey')
