import tippy from 'tippy.js'
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['trigger', 'content']

  connect () {
    this.#initializePopover()
  }

  #initializePopover () {
    this.tooltip = tippy(
      this.triggerTarget,
      {
        content: this.contentTarget.innerHTML,
        allowHTML: true,
        animation: 'shift-away-subtle'
      }
    )
  }
}
