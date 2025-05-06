import os

class Config:
    MYSQL_HOST = 'localhost'
    MYSQL_USER = 'root'
    MYSQL_PASSWORD = 'Hanzi123'
    MYSQL_DB = 'spdexpress' # replace 'musicdb' with your db name
    MYSQL_CURSORCLASS = 'DictCursor'

    # Session Configuration
    SESSION_TYPE = 'filesystem'
    SECRET_KEY = os.getenv('SECRET_KEY', 'supersecretkey')
