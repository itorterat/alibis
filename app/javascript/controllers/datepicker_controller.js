import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import monthSelectPlugin from "flatpickr/dist/plugins/monthSelect"


// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    console.log(this.element)
    flatpickr(this.element, {
      enableTime: true
    });
  }
}
