import { Controller } from '@hotwired/stimulus'
import anime from 'animejs'

export default class extends Controller {
  connect () {
    this.dispatch('connected', { detail: { controller: this } })
  }

  async open () {
    const timeline = anime({
      autoplay: false,
      duration: 1600,
      easing: 'easeOutQuint',
      targets: this.element,
      top: 0
    })

    timeline.play()

    await timeline.finished
  }

  async close () {
    const timeline = anime({
      autoplay: false,
      duration: 800,
      easing: 'easeOutQuint',
      targets: this.element,
      top: '100%'
    })

    timeline.play()

    await timeline.finished
  }
}
