import { Controller } from '@hotwired/stimulus'

class SelectableGuest {
  constructor (selectableGuestElement) {
    this.element = selectableGuestElement
    this.input = this.element.querySelector('input')
  }

  get guestId () {
    return this.input.value
  }

  get selected () {
    return !this.input.disabled
  }

  select () {
    this.input.disabled = false
  }

  unselect () {
    this.input.disabled = true
  }
}

export default class extends Controller {
  static targets = ['selectedGuestsList', 'unselectedGuestsList', 'guest']

  selectGuest ({ currentTarget: selectableGuestElement }) {
    const selectedGuest = new SelectableGuest(selectableGuestElement)

    if (selectedGuest.selected) {
      this.removeGuest(selectedGuest)
    } else {
      this.addGuest(selectedGuest)
    }
  }

  addGuest (unselectedGuest) {
    unselectedGuest.select()
    const selectedGuestElement = unselectedGuest.element.cloneNode(true)
    unselectedGuest.element.remove()
    this.selectedGuestsListTarget.appendChild(selectedGuestElement)
  }

  removeGuest (selectedGuest) {
    selectedGuest.unselect()
    const unselectedGuestElement = selectedGuest.element.cloneNode(true)
    selectedGuest.element.remove()
    this.unselectedGuestsListTarget.appendChild(unselectedGuestElement)
  }
}
