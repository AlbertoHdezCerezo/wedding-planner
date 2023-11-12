import anime from 'animejs'
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['progressBar']

  async connect () {
    await this.#showAndHideNotification()
  }

  async #showAndHideNotification () {
    this.animation = this.#revealAndHideAnimationTimeline()
    this.animation.play()
    await this.animation.finished
    this.element.remove()
  }

  async hideNotification () {
    this.animation.pause()
    this.animation = this.#hideAnimation()
    await this.animation.finished
    this.element.remove()
  }

  #revealAndHideAnimationTimeline () {
    const animation = anime.timeline({
      direction: 'normal',
      duration: 750,
      easing: 'easeOutExpo'
    })

    // 1. Reveal notification
    animation.add({
      targets: this.element,
      translateX: ['100%', '0%'],
      opacity: [0, 1]
    }, 0)

    // 2. Trigger progress bar
    animation.add({
      duration: 5000,
      targets: this.progressBarTarget,
      width: ['0%', '100%']
    }, 750)

    // 3. Hide notification
    animation.add({
      duration: 500,
      targets: this.element,
      translateX: ['0%', '100%'],
      opacity: [1, 0]
    }, 5000)

    return animation
  }

  #hideAnimation () {
    const animation = anime.timeline({
      direction: 'normal',
      duration: 750,
      easing: 'easeOutExpo'
    })

    // 1. Fill progress bar
    animation.add({
      targets: this.progressBarTarget,
      width: '100%'
    }, 0)

    // 3. Hide notification
    animation.add({
      targets: this.element,
      translateX: ['0%', '100%'],
      opacity: [1, 0]
    }, 0)

    return animation
  }
}
