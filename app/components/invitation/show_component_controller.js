import { Controller } from '@hotwired/stimulus'
import anime from 'animejs'

export default class extends Controller {
  static targets = ['startButton']

  envelopController = null
  letterController = null

  registerEnvelopController ({ detail: { controller: envelopController } }) {
    this.envelopController = envelopController
  }

  registerLetterController ({ detail: { controller: letterController } }) {
    this.letterController = letterController
  }

  #invitationReady () {
    return !!this.envelopController && !!this.letterController
  }

  async openLetter () {
    if (!this.#invitationReady()) return

    await this.#hideOpenInvitationButton()
    await this.#zoomOutEnvelop()
    await this.letterController.open()
  }

  async openEnvelop () {
    await this.letterController.close()
    await this.#zoomInEnvelop()
    await this.envelopController.open()
  }

  async #zoomOutEnvelop () {
    const timeline = anime({
      autoplay: false,
      duration: 1000,
      easing: 'easeOutQuint',
      targets: this.envelopController.element,
      scale: 0.6
    })

    timeline.play()

    await timeline.finished
  }

  async #zoomInEnvelop () {
    const timeline = anime({
      autoplay: false,
      duration: 600,
      easing: 'easeOutQuint',
      targets: this.envelopController.element,
      scale: 1
    })

    timeline.play()

    await timeline.finished
  }

  async #hideOpenInvitationButton () {
    const timeline = anime({
      autoplay: false,
      duration: 800,
      easing: 'easeInQuint',
      opacity: 0,
      targets: this.startButtonTarget,
      translateY: '120%'
    })

    timeline.play()

    await timeline.finished
  }
}
