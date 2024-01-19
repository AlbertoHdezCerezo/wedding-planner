import { Controller } from '@hotwired/stimulus'
import { Animator } from '../../javascript/src/invitation/animator'

const HIDE_START_BUTTON_ANIMATION = {
  duration: 800,
  easing: 'easeInQuint',
  opacity: 0,
  translateY: '120%'
}

const ZOOM_IN_ANIMATION = {
  duration: 600,
  easing: 'easeOutQuint',
  scale: 1
}

const ZOOM_OUT_ANIMATION = {
  duration: 1000,
  easing: 'easeOutQuint',
  scale: 0.6
}

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

  async #hideOpenInvitationButton () {
    await Animator.play(
      Animator.animation({
        targets: this.startButtonTarget,
        ...HIDE_START_BUTTON_ANIMATION
      })
    )
  }

  async #zoomInEnvelop () {
    await Animator.play(
      Animator.animation({
        targets: this.envelopController.element,
        ...ZOOM_IN_ANIMATION
      })
    )
  }

  async #zoomOutEnvelop () {
    await Animator.play(
      Animator.animation({
        targets: this.envelopController.element,
        ...ZOOM_OUT_ANIMATION
      })
    )
  }
}
