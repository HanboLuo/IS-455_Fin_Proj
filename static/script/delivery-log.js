async function loadDeliveryLog() {
    const courierId = document.getElementById("courierIdInput").value.trim();
    if (!courierId) return;
  
    const response = await fetch(`/api/delivery-log?courier=${courierId}`);
    const data = await response.json();
  
    const container = document.getElementById("logContainer");
    container.innerHTML = '';
  
    if (data.length === 0) {
      container.innerHTML = "<p style='color: #FF5F05'>No records found.</p>";
      return;
    }
  
    data.forEach(log => {
      const div = document.createElement("div");
      div.className = "top-song-item";
      div.innerHTML = `
        <span><strong>Tracking:</strong> ${log.TrackingNumber}</span><br/>
        <span><strong>Courier:</strong> ${log.CourierName}</span><br/>
        <span><strong>Pickup Time:</strong> ${log.PickupTime}</span><br/>
        <span><strong>Delivery Time:</strong> ${log.DeliveryTime}</span><br/>
        <span><strong>Feedback:</strong> ${log.CustomerFeedback || 'None'}</span><br/>
        <span><strong>Rating:</strong> ${log.FeedbackRating || 'N/A'}</span>
      `;
      container.appendChild(div);
    });
  }
  