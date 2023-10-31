import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['trigger', 'background', 'content']

  connect () {
    this.opened = false

    this.#hide()
    if (!this.hasTriggerTarget) {
      this.open()
    }
  }

  #hide () {
    this.backgroundTarget.classList.add('hidden')
    this.opened = false
  }

  open () {
    this.backgroundTarget.classList.remove('hidden')
    this.opened = true
  }

  close () {
    this.#hide()
  }
}
