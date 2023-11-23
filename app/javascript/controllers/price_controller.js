import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price"
export default class extends Controller {
  static targets = ["btn", "total"]

  static values = {
    price: Number
  }

  connect() {
  }

  handleDateChange(event) {
    const dates = event.currentTarget.value
    if (dates.includes("to")) {
      const [start, end] = dates.split(" to ")
      const days = (new Date(end) - new Date(start)) / 86400000
      const total = days * this.priceValue
      this.totalTarget.innerHTML = `Total: <strong>${total}€</strong>`

      this.btnTarget.classList.remove("disabled")
    }
  }
}
