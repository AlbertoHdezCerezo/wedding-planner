import tippy from 'tippy.js'
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['trigger', 'content']

  static values = {
    tippyOptions: Object
  }

  connect () {
    this.#initializePopover()
  }

  #initializePopover () {
    console.log(
      {
        ...this.#defaultTippyOptions(),
        ...(this.hasTippyOptionsValue ? this.tippyOptionsValue : {})
      }
    )
    this.tooltip = tippy(
      this.triggerTarget,
      {
        ...this.#defaultTippyOptions(),
        ...(this.hasTippyOptionsValue ? this.tippyOptionsValue : {})
      }
    )
  }

  #defaultTippyOptions () {
    return {
      allowHTML: true,
      animation: 'shift-away-subtle',
      content: this.contentTarget.innerHTML,
      theme: 'transparent',
      arrow: false
    }
  }
}
