window.onload = async function () {
    const response = await fetch("/api/dispatch");
    const data = await response.json();
  
    const container = document.getElementById("dispatchContainer");
    container.innerHTML = '';
  
    if (data.length === 0) {
      container.innerHTML = "<p style='color: #FF5F05'>No dispatch data available.</p>";
      return;
    }
  
    data.forEach(item => {
      const div = document.createElement("div");
      div.className = "top-song-item";
      div.innerHTML = `
        <span><strong>Courier:</strong> ${item.CourierName}</span><br/>
        <span><strong>Zone:</strong> ${item.ZoneName}</span><br/>
        <span><strong>Total Deliveries:</strong> ${item.TotalDeliveries}</span><br/>
        <span><strong>Last Parcel:</strong> ${item.LastParcel || 'N/A'}</span><br/>
        <span><strong>Last Delivered:</strong> ${item.LastDeliveryTime || 'N/A'}</span>
      `;
      container.appendChild(div);
    });
  };
  