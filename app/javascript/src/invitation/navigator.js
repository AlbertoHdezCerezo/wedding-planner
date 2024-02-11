import { Animator } from './animator'
import { DeviceRecognizer } from '../lib/deviceRecognizer'

const ATTACH_ANIMATION = {
  autoplay: false,
  duration: 600,
  easing: 'linear',
  translateY: ['50px', 0],
  opacity: [0, 1]
}

const DETACH_ANIMATION = {
  autoplay: false,
  duration: 600,
  easing: 'linear',
  translateY: [0, '-50px'],
  opacity: [1, 0]
}

// Represents an invitation page (welcome, schedule, etc).
export class Page {
  // Verifies template complies with format constraints to be treated as page
  static valid (template) {
    return template.tagName.toLowerCase() === 'template' && !!template.dataset.pageName
  }

  // element template representing an invitation page
  template = null
  // element representing page, when this is rendered out of template
  element = null

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

  get attached () {
    return this.element !== null
  }

  async attach (attachmentTarget) {
    attachmentTarget.appendChild(this.layout)
    this.element = attachmentTarget.lastElementChild
    await Animator.play(Animator.animation({ ...ATTACH_ANIMATION, targets: this.element }))
    return this.element
  }

  async detach () {
    if (this.attached) {
      await Animator.play(Animator.animation({ ...DETACH_ANIMATION, targets: this.element }))
      this.element.remove()
      this.element = null
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

  /**
   * By prefixing a page name with '-phone' the Navigator will try to find
   * a page with the same name but with the '-phone' suffix. Use this when
   * you want to define different page layouts for mobile and desktop.
   * @param name
   * @returns {string}
   */
  #phonePageName (name) {
    return `${name}-phone`
  }

  page (name) {
    let page = null

    if (DeviceRecognizer.isMobile()) {
      console.log(this.#phonePageName(name))
      page = this.pages.find((page) => page.name === this.#phonePageName(name))
      console.log(page)
    }

    return page || this.pages.find((page) => page.name === name)
  }

  /**
   * Switch between pages. Replaces current page (if there is one attached)
   * by the given one. If no page is attached, the given page is attached.
   * @param {String} name
   */
  async navigateTo (name) {
    const page = this.page(name)

    if (this.currentPage?.attached) {
      if (this.currentPage.name === name) return

      await this.currentPage.detach()
    }

    await page.attach(this.attachmentTarget)
    this.currentPage = page
  }
}
