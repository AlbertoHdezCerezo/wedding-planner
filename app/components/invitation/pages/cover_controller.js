import { Controller } from '@hotwired/stimulus'

/**
 * Small controller which listens for invitation confirmation form
 * submission event. When the invitation is successfully confirmed,
 * displays the button to save the event to the user's calendar.
 */
export default class extends Controller {
  static targets = ['acceptButton', 'eventButton']

  greetConfirmedGuest ({ detail: { fetchResponse } }) {
    if (fetchResponse.succeeded) {

    }
  }
}
