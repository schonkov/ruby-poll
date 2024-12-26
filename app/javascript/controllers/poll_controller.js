import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["answers", "template"]

  connect() {
    console.log("Hello from Layout Controller!"); // Debugging message
    this.index = this.answersTarget.querySelectorAll('.answer-field').length
  }

  addAnswer(event) {
    event.preventDefault()

    const clone = this.templateTarget.content.cloneNode(true)

    const input = clone.querySelector('.answer-input')
    if (input) {
      input.setAttribute('name', `poll[answers_attributes][${this.index}][text]`)
    }

    this.answersTarget.appendChild(clone)

    this.index++
  }

  removeAnswer(event) {
    event.preventDefault()
    const answerField = event.target.closest('.answer-field')
    if (answerField) {
      const destroyCheckbox = answerField.querySelector('input[type="checkbox"][name*="_destroy"]')
      if (destroyCheckbox) {
        destroyCheckbox.checked = true
        answerField.style.display = 'none'
      } else {
        answerField.remove()
      }
    }
  }
}