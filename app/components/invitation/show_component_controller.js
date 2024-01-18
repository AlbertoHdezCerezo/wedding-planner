import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  envelopController = null
  letterController = null

  registerEnvelopController ({ detail: { controller: envelopController } }) {
    this.envelopController = envelopController
  }

  registerLetterController ({ detail: { controller: letterController } }) {
    this.letterController = letterController
  }

  #invitationReady () {
    return !!this.envelopController && !!this.letterController
  }

  async openLetter () {
    await this.letterController.open()
  }

  openCard () {

  }
}
