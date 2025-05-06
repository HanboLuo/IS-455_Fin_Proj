from flask import Flask, request, jsonify, render_template
from flask_mysqldb import MySQL
from config import Config

app = Flask(__name__)
app.config.from_object(Config)
mysql = MySQL(app)

# ---------------------------
# Track Parcel Page & API
# ---------------------------

@app.route('/')
def home():
    return render_template('track.html')

@app.route('/track')
def track_parcel():
    tracking_number = request.args.get('number', '').strip()
    if not tracking_number:
        return jsonify([])

    cursor = mysql.connection.cursor()
    try:
        sql = """
        SELECT 
            p.TrackingNumber,
            p.CurrentStatus,
            d.PickupTime,
            d.DeliveryTime,
            CONCAT(e.EmpFName, ' ', e.EmpLName) AS CourierName
        FROM parcel p
        LEFT JOIN deliveryrecord d ON p.TrackingNumber = d.TrackingNumber
        LEFT JOIN courier c ON d.CourierID = c.CourierID
        LEFT JOIN employee e ON c.CourierID = e.EmployeeID
        WHERE p.TrackingNumber = %s
        """
        cursor.execute(sql, (tracking_number,))
        result = cursor.fetchall()
        return jsonify(result)
    finally:
        cursor.close()

@app.route('/recent-deliveries')
def recent_deliveries():
    cursor = mysql.connection.cursor()
    try:
        sql = """
        SELECT TrackingNumber, CurrentStatus
        FROM parcel
        ORDER BY EstimatedDeliveryDate DESC
        LIMIT 5
        """
        cursor.execute(sql)
        rows = cursor.fetchall()
        return jsonify(rows)
    finally:
        cursor.close()

# ---------------------------
# Orders Page + API
# ---------------------------

@app.route('/orders.html')
def orders_page():
    return render_template('orders.html')

@app.route('/api/orders')
def get_orders():
    customer_id = request.args.get('customer', '').strip()
    if not customer_id:
        return jsonify([])

    cursor = mysql.connection.cursor()
    try:
        sql = """
        SELECT
            o.OrderID,
            o.OrderDate,
            o.TotalCost,
            o.PaymentStatus,
            p.PaymentMethod,
            p.PaymentDate,
            pa.TrackingNumber,
            pa.Weight,
            pa.Length,
            pa.Width,
            pa.Height,
            pa.CurrentStatus,
            pa.InsuranceAmount
        FROM `order` o
        LEFT JOIN payment p ON o.OrderID = p.OrderID
        LEFT JOIN parcel pa ON pa.SenderID = o.CustomerID
        WHERE o.CustomerID = %s
        ORDER BY o.OrderDate DESC
        """
        cursor.execute(sql, (customer_id,))
        orders = cursor.fetchall()
        return jsonify(orders)
    finally:
        cursor.close()

# ---------------------------
# Dispatch Page + API
# ---------------------------

@app.route('/dispatch.html')
def dispatch_page():
    return render_template('dispatch.html')

@app.route('/api/dispatch')
def get_dispatch_data():
    cursor = mysql.connection.cursor()
    try:
        sql = """
        SELECT
            e.EmployeeID,
            CONCAT(e.EmpFName, ' ', e.EmpLName) AS CourierName,
            dz.ZoneName,
            COUNT(dr.DeliveryID) AS TotalDeliveries,
            MAX(dr.DeliveryTime) AS LastDeliveryTime,
            MAX(dr.TrackingNumber) AS LastParcel
        FROM employee e
        JOIN courier c ON e.EmployeeID = c.CourierID
        LEFT JOIN deliveryzone dz ON c.ZoneID = dz.ZoneID
        LEFT JOIN deliveryrecord dr ON c.CourierID = dr.CourierID
        GROUP BY e.EmployeeID, CourierName, dz.ZoneName
        ORDER BY TotalDeliveries DESC
        """
        cursor.execute(sql)
        results = cursor.fetchall()
        return jsonify(results)
    finally:
        cursor.close()

# ---------------------------
# Delivery Log Page + API
# ---------------------------

@app.route('/delivery-log.html')
def delivery_log_page():
    return render_template('delivery-log.html')


@app.route('/api/delivery-log')
def delivery_log():
    courier_id = request.args.get('courier', '').strip()
    if not courier_id:
        return jsonify([])

    cursor = mysql.connection.cursor()
    try:
        sql = """
        SELECT
            d.TrackingNumber,
            CONCAT(e.EmpFName, ' ', e.EmpLName) AS CourierName,
            d.PickupTime,
            d.DeliveryTime,
            d.CustomerFeedback,
            d.FeedbackRating
        FROM deliveryrecord d
        JOIN courier c ON d.CourierID = c.CourierID
        JOIN employee e ON c.CourierID = e.EmployeeID
        WHERE d.CourierID = %s
        ORDER BY d.DeliveryTime DESC
        """
        cursor.execute(sql, (courier_id,))
        results = cursor.fetchall()
        return jsonify(results)
    finally:
        cursor.close()


# ---------------------------
# Feedback Page (placeholder)
# ---------------------------

@app.route('/feedback.html')
def feedback_page():
    return render_template('feedback.html')

@app.route('/api/submit-feedback', methods=['POST'])
def submit_feedback():
    data = request.get_json()
    tracking_number = data.get('trackingNumber')
    rating = data.get('feedbackRating')
    comment = data.get('customerFeedback', '')

    if not tracking_number or not rating:
        return jsonify({'status': 'error', 'message': 'Missing tracking number or rating.'})

    cursor = mysql.connection.cursor()
    try:
        sql = """
        UPDATE deliveryrecord
        SET CustomerFeedback = %s, FeedbackRating = %s
        WHERE TrackingNumber = %s
        """
        cursor.execute(sql, (comment, rating, tracking_number))
        mysql.connection.commit()
        return jsonify({'status': 'ok', 'message': 'Feedback submitted successfully!'})
    finally:
        cursor.close()


# ---------------------------
# Run App
# ---------------------------

if __name__ == '__main__':
    app.run(debug=True)
