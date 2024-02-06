import { Controller } from '@hotwired/stimulus'
import { Animator } from '../../javascript/src/invitation/animator'

const FLIP_ANIMATION = {
  autoplay: false,
  duration: 1200,
  easing: 'easeOutCubic',
  rotateY: '180deg'
}

const MENU_REVEAL_ANIMATION = {
  autoplay: false,
  delay: (el, i) => i * 200,
  duration: 1200,
  easing: 'easeInExpo',
  opacity: [0, 1],
  translateY: ['120%', 0]
}

export default class extends Controller {
  // Pivot element for rotation
  static targets = [
    // Container wrapping both invitation sides
    'innerLetter',
    // Container wrapping navigation menu
    'menu'
  ]

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
    await this.#revealMenu()
  }

  async #flip () {
    await Animator.play(
      Animator.animation({
        targets: this.innerLetterTarget,
        ...FLIP_ANIMATION
      })
    )
  }

  async #revealMenu () {
    await Animator.play(
      Animator.animation({
        targets: Array.from(this.menuTarget.children),
        ...MENU_REVEAL_ANIMATION
      })
    )
  }
}
