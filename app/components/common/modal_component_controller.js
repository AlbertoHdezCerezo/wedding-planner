import anime from 'animejs'
import { Controller } from '@hotwired/stimulus'

const animationPayload = {
  duration: 1000,
  easing: 'linear',
  translateY: [2000, 0],
  opacity: [0.5, 1]
}

export default class extends Controller {
  static targets = ['trigger', 'background', 'content']

  async connect () {
    this.#hide()

    if (!this.hasTriggerTarget) await this.open()
  }

  #hide () {
    this.backgroundTarget.classList.add('hidden')
  }

  #reveal () {
    this.backgroundTarget.classList.remove('hidden')
  }

  async open () {
    this.#reveal()

    await anime({
      ...animationPayload,
      targets: this.backgroundTarget
    }).finished
  }

  async close () {
    await anime({
      ...animationPayload,
      direction: 'reverse',
      targets: this.backgroundTarget
    }).finished

    this.#hide()
  }
}
