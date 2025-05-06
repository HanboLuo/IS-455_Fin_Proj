async function trackParcel() {
  const trackingNumber = document.getElementById("trackingInput").value.trim();
  if (!trackingNumber) return;

  const response = await fetch(`/track?number=${trackingNumber}`);
  const data = await response.json();

  const resultContainer = document.getElementById("trackingResult");
  resultContainer.innerHTML = '';

  if (data.length === 0) {
    resultContainer.innerHTML = "<p style='color: #FF5F05'>No results found.</p>";
    return;
  }

  const info = data[0];
  resultContainer.innerHTML = `
    <div class="top-song-item">
      <span><strong>Tracking:</strong> ${info.TrackingNumber}</span><br/>
      <span><strong>Status:</strong> ${info.CurrentStatus}</span><br/>
      <span><strong>Courier:</strong> ${info.CourierName || "Assigned"}</span><br/>
      <span><strong>Pickup:</strong> ${info.PickupTime || "N/A"}</span><br/>
      <span><strong>Delivered:</strong> ${info.DeliveryTime || "N/A"}</span>
    </div>
  `;
}

async function loadRecentDeliveries() {
  const response = await fetch('/recent-deliveries');
  const deliveries = await response.json();
  const container = document.getElementById("recentDeliveries");
  container.innerHTML = '';

  deliveries.forEach(d => {
    const div = document.createElement("div");
    div.className = "top-song-item";
    div.innerHTML = `<span>${d.TrackingNumber} - ${d.CurrentStatus}</span>`;
    container.appendChild(div);
  });
}

window.onload = loadRecentDeliveries;
