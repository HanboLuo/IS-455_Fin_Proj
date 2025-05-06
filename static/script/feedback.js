async function submitFeedback() {
    const tracking = document.getElementById("trackInput").value.trim();
    const rating = document.getElementById("ratingInput").value.trim();
    const comment = document.getElementById("commentInput").value.trim();
    const result = document.getElementById("feedbackResult");
  
    if (!tracking || !rating) {
      result.innerHTML = "<p style='color: #FF5F05'>Tracking number and rating are required.</p>";
      return;
    }
  
    const response = await fetch('/api/submit-feedback', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        trackingNumber: tracking,
        feedbackRating: parseInt(rating),
        customerFeedback: comment
      })
    });
  
    const res = await response.json();
    if (res.status === 'ok') {
      result.innerHTML = `<p style="color: #00cc66">${res.message}</p>`;
    } else {
      result.innerHTML = `<p style="color: #FF5F05">${res.message}</p>`;
    }
  }
  