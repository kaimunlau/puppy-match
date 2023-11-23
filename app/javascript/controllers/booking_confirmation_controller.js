import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-confirmation"
export default class extends Controller {
  static values = {
    booking: Number
  }

  static targets = ["status", "btns"]

  connect() {
  }

  confirm(event) {
    fetch(
      `/bookings/${this.bookingValue}`,
      {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ status: event.currentTarget.dataset.status })
      }
    )
      .then(response => response.json())
      .then((data) => {
        this.statusTarget.innerText = `Status: ${data.new_status}`
        this.btnsTarget.classList.add("d-none")
      })
  }
}
