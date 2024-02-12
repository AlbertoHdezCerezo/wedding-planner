import { Animator } from '../../../javascript/src/invitation/animator'
import { Controller } from '@hotwired/stimulus'
import JSConfetti from 'js-confetti'

const BEFORE_ACCEPT_ANIMATION = {
  autoplay: false,
  duration: 800,
  easing: 'easeInExpo',
  opacity: [1, 0]
}

const AFTER_ACCEPT_ANIMATION = {
  autoplay: false,
  duration: 800,
  easing: 'easeInExpo',
  opacity: [0, 1]
}

/**
 * Small controller which listens for invitation confirmation form
 * submission event. When the invitation is successfully confirmed,
 * displays the button to save the event to the user's calendar.
 */
export default class extends Controller {
  static targets = [
    // Target/s whose content is displayed before the invitation is accepted
    'beforeAccept',
    // Target/s whose content is displayed after the invitation is accepted
    'afterAccept'
  ]

  markInvitationAsConfirmed ({ detail: { fetchResponse } }) {
    if (fetchResponse.succeeded) this.greetConfirmedGuest()
  }

  greetConfirmedGuest () {
    this.#throwConfetti()
    this.#switchConfirmAndCalendarButtons()
  }

  async #throwConfetti () {
    const confetti = new JSConfetti()
    await confetti.addConfetti({ emojis: ['🔔', '💒', '🥂', '✨', '💍', '🍾'] })
    confetti.clearCanvas()
  }

  async #switchConfirmAndCalendarButtons () {
    await Animator.play(
      Animator.animation({
        targets: this.beforeAcceptTarget,
        ...BEFORE_ACCEPT_ANIMATION
      })
    )

    // Remove the before-accept content from the DOM and reveal the after-accept content
    this.beforeAcceptTarget.remove()
    this.afterAcceptTarget.classList.remove('hidden')

    await Animator.play(
      Animator.animation({
        targets: this.afterAcceptTarget,
        ...AFTER_ACCEPT_ANIMATION
      })
    )
  }
}
