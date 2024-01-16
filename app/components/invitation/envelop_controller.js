import { Controller } from '@hotwired/stimulus'
import anime from 'animejs'

export default class extends Controller {
  // Pivot element for rotation
  static targets = ['innerLetter']

  // Tracks flip state. If true it means the back of the letter faces the screen
  flipped = false
  // AnimeJS timeline instance
  timeline = null

  async flip () {
    if (this.timeline) return

    this.timeline = anime
      .timeline({ easing: 'easeInQuad', duration: 1400, autoplay: false })
      .add({ targets: this.innerLetterTarget, rotateY: this.flipped ? '0deg' : '180deg' })

    this.timeline.play()

    await this.timeline.finished

    this.timeline = null
    this.flipped = !this.flipped
  }
}
