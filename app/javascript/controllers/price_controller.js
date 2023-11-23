import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price"
export default class extends Controller {
  static targets = ["btn"]

  connect() {
    console.log(this.btnTarget)
  }

  handleDateChange(event) {
    const dates = event.currentTarget.value
    if (dates.includes("to")) {
      this.btnTarget.classList.remove("disabled")
    }
  }
}
