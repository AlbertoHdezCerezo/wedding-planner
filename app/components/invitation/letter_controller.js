import { Controller } from '@hotwired/stimulus'
import { Animator } from '../../javascript/src/invitation/animator'

const OPEN_ANIMATION = {
  duration: 1600,
  easing: 'easeOutQuint',
  top: 0
}

const CLOSE_ANIMATION = {
  duration: 800,
  easing: 'easeOutQuint',
  top: '-100%'
}

export default class extends Controller {
  connect () {
    this.dispatch('connected', { detail: { controller: this } })
  }

  async open () {
    await Animator.play(
      Animator.animation({
        targets: this.element,
        ...OPEN_ANIMATION
      })
    )
  }

  async close () {
    await Animator.play(
      Animator.animation({
        targets: this.element,
        ...CLOSE_ANIMATION
      })
    )

    this.element.scrollTop = 0
    this.element.style.top = '100%'
  }
}
