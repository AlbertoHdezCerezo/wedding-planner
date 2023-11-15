import tippy from 'tippy.js'
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [
    // Wraps the elements which trigger the popover display on hover/click/...
    'trigger',
    // Wraps the popover content.
    'content'
  ]

  static values = {
    tippyOptions: Object
  }

  connect () {
    this.#initializePopover()
  }

  #initializePopover () {
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
      appendTo: 'parent',
      arrow: false,
      animation: 'shift-away-subtle',
      content: this.contentTarget.innerHTML,
      theme: 'transparent'
    }
  }
}
