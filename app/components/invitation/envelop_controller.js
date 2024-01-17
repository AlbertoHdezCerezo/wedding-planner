import { Controller } from '@hotwired/stimulus'
import anime from 'animejs'

export default class extends Controller {
  // Pivot element for rotation
  static targets = [
    // Container wrapping both invitation sides
    'innerLetter',
    // Container wrapping navigation menu
    'menu'
  ]

  async open () {
    await this.#flip()
    await this.#revealMenu()
  }

  async #flip () {
    const timeline = anime({
      autoplay: false,
      duration: 1400,
      easing: 'easeInQuad',
      targets: this.innerLetterTarget,
      rotateY: '180deg'
    })

    timeline.play()

    await timeline.finished
  }

  async #revealMenu () {
    const timeline = anime({
      autoplay: false,
      delay: (el, i) => i * 200,
      duration: 1200,
      easing: 'easeInExpo',
      opacity: [0, 1],
      targets: Array.from(this.menuTarget.children),
      translateY: ['120%', 0]
    })

    timeline.play()

    await timeline.finished
  }
}
