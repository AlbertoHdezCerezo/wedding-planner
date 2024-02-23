import { Controller } from '@hotwired/stimulus'
import { Animator } from '../../javascript/src/invitation/animator'
import { DeviceRecognizer } from '../../javascript/src/lib/deviceRecognizer'

const REVEAL_ENVELOP_ANIMATIONS = [
  {
    delay: 1600,
    duration: 0,
    translateY: '100vh',
    rotate: 15
  },
  {
    duration: 1400,
    easing: 'easeOutQuart',
    translateY: 0
  },
  {
    duration: 800,
    easing: 'easeOutQuart',
    rotate: 0
  }
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
  // Indicates whether invitation was already accepted or not
  static values = { invitationAccepted: Boolean }

  envelopController = null
  letterController = null

  letterReopened = false

  connect () {
    /**
     * For mobile devices ensure layout fits the window boundaries and not
     * the screen limits (so the navigation bar, for example, is excluded)
     */
    if (DeviceRecognizer.isMobile()) {
      this.element.style.width = `${window.innerWidth}px`
      // this.element.style.height = `${window.innerHeight}px`
    }
  }

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

    if (this.invitationAcceptedValue) {
      await this.envelopController.open()
    }
  }

  async openLetter () {
    if (!this.#invitationReady()) return
    if (this.invitationAcceptedValue) {
      await this.envelopController.open()
    } else {
      await this.#zoomOutEnvelop()
      await this.letterController.open()
    }
  }

  async openEnvelop () {
    await this.letterController.close()
    await this.#zoomInEnvelop()

    if (this.letterReopened) {
      this.letterReopened = false
    } else {
      await this.envelopController.open()
    }
  }

  async reopenLetter () {
    this.letterReopened = true
    await this.#zoomOutEnvelop()
    await this.letterController.open()
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
