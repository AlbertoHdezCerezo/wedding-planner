import anime from 'animejs'
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['trigger', 'content', 'contentBackground', 'contentBody']

  async connect () {
    this.#hide()

    if (!this.hasTriggerTarget) await this.open()
  }

  #hidden () {
    return this.contentTarget.classList.contains('hidden')
  }

  #hide () {
    this.contentTarget.classList.add('hidden')
  }

  #reveal () {
    this.contentTarget.classList.remove('hidden')
  }

  #animationTimeline (direction = 'normal') {
    const animation = anime.timeline({
      direction,
      duration: 750,
      easing: 'easeOutExpo'
    })

    animation.add({
      targets: this.contentBackgroundTarget,
      opacity: [0, 0.8]
    }, 0)

    animation.add({
      targets: this.contentBodyTarget,
      translateY: ['50vh', '0vh'],
      opacity: [0, 1]
    }, 0)

    return animation
  }

  async open () {
    if (this.#hidden() && !this.animation) {
      this.#reveal()

      this.animation = this.#animationTimeline()
      this.animation.play()

      await this.animation.finished

      this.animation = null
    }
  }

  async close () {
    if (!this.animation && !this.#hidden()) {
      this.animation = this.#animationTimeline('reverse')
      this.animation.play()

      await this.animation.finished

      this.#hide()
      this.animation = null
    }
  }
}
