import { Controller } from '@hotwired/stimulus';
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

export default class extends Controller {
  static targets = [ "startDate", "endDate" ]
  connect() {
    flatpickr(this.startDateTarget, {
  //    plugins: [new rangePlugin({ input: "#end_date"})]
    })
    flatpickr(this.endDateTarget, {})
  }
}
