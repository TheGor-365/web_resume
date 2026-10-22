import { Controller } from "@hotwired/stimulus"

// Displays localized file-picker text inside Turbo-replaced email forms.
// File names are inserted as text, never HTML; the multipart input is unchanged.
export default class extends Controller {
  static targets = ["input", "selection"]

  connect() {
    this.update()
  }

  update() {
    const files = Array.from(this.inputTarget.files || [])
    this.selectionTarget.textContent = files.length === 0
      ? this.selectionTarget.dataset.emptyText
      : files.map((file) => file.name).join(", ")
  }
}
