// Represents an invitation page (welcome, schedule, etc).
export class Page {
  // Verifies template complies with format constraints to be treated as page
  static valid (template) {
    return template.tagName.toLowerCase() === 'template' && !!template.dataset.pageName
  }

  // element template representing an invitation page
  template = null
  // element representing page, when this is rendered out of template
  instance = null

  constructor (template) {
    if (!Page.valid(template)) {
      throw new Error(
      `
        Attemp to instantiate InvitationPage with invalid template.
        Make sure all your Page-base components present a layout
        with a root template element and a dataset with the name property.
      `
      )
    }

    this.template = template
  }

  get name () {
    return this.template.dataset.pageName
  }

  get layout () {
    return this.template.content.cloneNode(true)
  }

  attached () {
    return this.instance !== null
  }

  attach (attachmentTarget) {
    attachmentTarget.appendChild(this.layout)
    this.instance = attachmentTarget.lastElementChild
    return this.instance
  }

  detach () {
    if (this.attached()) {
      this.instance.remove()
      this.instance = null
    }
  }
}

export class Navigator {
  // element to which pages are attached
  attachmentTarget = null
  // list of available pages
  pages = []
  // current attached page
  currentPage = null

  constructor (pageTemplates, attachmentTarget) {
    this.pages = pageTemplates.map((template) => new Page(template))
    this.attachmentTarget = attachmentTarget
  }

  page (name) {
    return this.pages.find((page) => page.name === name)
  }

  /**
   * Switch between pages. Replaces current page (if there is one attached)
   * by the given one. If no page is attached, the given page is attached.
   * @param {String} name
   */
  navigateTo (name) {
    const page = this.page(name)

    if (this.currentPage && this.currentPage.attached()) { this.currentPage.detach() }

    page.attach(this.attachmentTarget)
    this.currentPage = page
  }
}
