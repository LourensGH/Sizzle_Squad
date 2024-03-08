import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form1", "form2"];

  connect() {
    console.log("Hello");
  }

  radius(event) {
    event.preventDefault();
    console.log("hi");
    this.form1Target.classList.toggle("d-none");
    this.form2Target.classList.toggle("d-none");
  }
}
