import { Controller } from '@hotwired/stimulus'
import { Animator } from '../../javascript/src/invitation/animator'

const REVEAL_ENVELOP_ANIMATIONS = [
]

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
  envelopController = null
  letterController = null

  registerEnvelopController ({ detail: { controller: envelopController } }) {
    this.envelopController = envelopController
    this.#revealEnvelop()
  }

  registerLetterController ({ detail: { controller: letterController } }) {
    this.letterController = letterController
  }

  #invitationReady () {
    return !!this.envelopController && !!this.letterController
  }

  async #revealEnvelop () {
    const animations = REVEAL_ENVELOP_ANIMATIONS.map(animationPayload => {
      return Object.assign(animationPayload, { targets: this.envelopController.element })
    })

    await Animator.playTimeline(Animator.timeline(animations))

    this.envelopController.enableMouseEvents()
  }

  async openLetter () {
    if (!this.#invitationReady()) return

    await this.#zoomOutEnvelop()
    await this.letterController.open()
  }

  async openEnvelop () {
    await this.letterController.close()
    await this.#zoomInEnvelop()
    await this.envelopController.open()
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
