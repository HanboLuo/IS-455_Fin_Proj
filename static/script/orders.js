async function loadOrders() {
    const customerId = document.getElementById("customerIdInput").value.trim();
    if (!customerId) return;
  
    const response = await fetch(`/api/orders?customer=${customerId}`);
    const orders = await response.json();
  
    const resultContainer = document.getElementById("orderResults");
    resultContainer.innerHTML = '';
  
    if (orders.length === 0) {
      resultContainer.innerHTML = "<p style='color: #FF5F05'>No orders found.</p>";
      return;
    }
  
    orders.forEach(order => {
      const div = document.createElement("div");
      div.className = "top-song-item";
      div.innerHTML = `
        <span><strong>Order ID:</strong> ${order.OrderID}</span><br/>
        <span><strong>Date:</strong> ${order.OrderDate}</span><br/>
        <span><strong>Total:</strong> $${order.TotalCost}</span><br/>
        <span><strong>Payment:</strong> ${order.PaymentStatus} via ${order.PaymentMethod || 'N/A'} at ${order.PaymentDate || 'N/A'}</span><br/><br/>
  
        <span><strong>Tracking Number:</strong> ${order.TrackingNumber || 'N/A'}</span><br/>
        <span><strong>Status:</strong> ${order.CurrentStatus || 'N/A'}</span><br/>
        <span><strong>Weight:</strong> ${order.Weight || 'N/A'} kg</span><br/>
        <span><strong>Size:</strong> ${order.Length || 'N/A'} × ${order.Width || 'N/A'} × ${order.Height || 'N/A'} cm</span><br/>
        <span><strong>Insurance:</strong> $${order.InsuranceAmount || '0.00'}</span>
      `;
      resultContainer.appendChild(div);
    });
  }
  