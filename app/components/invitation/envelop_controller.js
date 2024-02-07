import { Controller } from '@hotwired/stimulus'
import { Animator } from '../../javascript/src/invitation/animator'

const FLIP_ANIMATION = {
  autoplay: false,
  duration: 1200,
  easing: 'easeOutCubic',
  rotateY: '180deg'
}

export default class extends Controller {
  // Pivot element for rotation
  static targets = [
    // Container wrapping both invitation sides
    'innerLetter',
    // Container wrapping navigation menu
    'menu'
  ]

  cardController = null

  registerCardController ({ detail: { controller: cardController } }) {
    this.cardController = cardController
  }

  connect () {
    this.disableMouseEvents()
    this.dispatch('connected', { detail: { controller: this } })
  }

  enableMouseEvents () {
    this.element.style.pointerEvents = 'auto'
  }

  disableMouseEvents () {
    this.element.style.pointerEvents = 'none'
  }

  async open () {
    this.disableMouseEvents()
    await this.#flip()
    await this.cardController.revealMenu()
  }

  async #flip () {
    await Animator.play(
      Animator.animation({
        targets: this.innerLetterTarget,
        ...FLIP_ANIMATION
      })
    )
  }
}
