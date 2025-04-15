from flask import Flask, request, jsonify, render_template
from flask_mysqldb import MySQL
from config import Config 

app = Flask(__name__)
app.config.from_object(Config)
mysql = MySQL(app)

if __name__ == '__main__':
    app.run(debug=True)

@app.route('/')
def index():
    return render_template('music.html')

@app.route('/top-songs')
def top_songs():
    # Returns the top 5 songs (by likes) from the database.
    cursor = mysql.connection.cursor()
    try:
        sql = f"SELECT id, name, artist, likes FROM songs ORDER BY likes DESC LIMIT 5"
        cursor.execute(sql)
        rows = cursor.fetchall()
        return jsonify(rows)
    finally:
        cursor.close()

@app.route('/search')
def search():
    # Search for songs matching the given query in either the name or artist fields.
    query = request.args.get('search', '').strip()
    cursor = mysql.connection.cursor()
    try:
        if not query:
            # If no query is provided, return empty or all
            return jsonify([])

        sql = f"SELECT id, name, artist, likes FROM songs WHERE name LIKE %s OR artist LIKE %s"
        search = f"%{query}%"
        cursor.execute(sql, (search, search))
        rows = cursor.fetchall()
        return jsonify(rows)
    finally:
        cursor.close()

@app.route('/add-to-collection', methods=['POST'])
def add_to_collection():
    #Add a song to the user's collection. (In a real app, you'd track which user is logged in, etc.)
    data = request.get_json()
    song_id = data.get('id')

    cursor = mysql.connection.cursor()
    try:
        cursor.execute("UPDATE songs SET collected = TRUE WHERE id = %s", (song_id,))
        mysql.connection.commit()
        return jsonify({'status': 'ok', 'message': f'Song {song_id} marked as collected.'})
    finally:
        cursor.close()

@app.route('/my-collection')
def my_collection():
    # Returns the user's collection of songs
    cursor = mysql.connection.cursor()
    sql = f"SELECT id, name, artist, genre, likes FROM songs WHERE collected = TRUE ORDER BY name ASC"
    try:
        cursor.execute(sql)
        collection = cursor.fetchall()
        return jsonify(collection)
    finally:
        cursor.close()


@app.route('/remove-from-collection', methods=['POST'])
def remove_from_collection():
    # Remove a song from the user's collection
    data = request.get_json()
    song_id = data.get('id')

    cursor = mysql.connection.cursor()
    try:
        cursor.execute("UPDATE songs SET collected = FALSE WHERE id = %s", (song_id,))
        mysql.connection.commit()
        return jsonify({'status': 'ok', 'message': f'Song {song_id} removed from collection.'})
    finally:
        cursor.close()


