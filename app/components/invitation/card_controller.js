import { Controller } from '@hotwired/stimulus'
import { Navigator } from '../../javascript/src/invitation/navigator'
import { Animator } from '../../javascript/src/invitation/animator'

const MENU_REVEAL_ANIMATION = {
  autoplay: false,
  delay: (el, i) => i * 200,
  duration: 1200,
  easing: 'easeInExpo',
  opacity: [0, 1],
  translateY: ['120%', 0]
}

/**
 * Implement the invitation logic to navigate between the different
 * its different pages (welcome, schedule, etc.).
 *
 * The postcard is composed by multiple pages, each one encapsulated
 * within a `template` element with some basic metadata information.
 * The controller counts with different actions for page navigation.
 * To navigate between pages, the controller uses the page metadata
 * information and the `template` content to render each page in a
 * programmatic way, giving the impression of a SPA.
 */
export default class extends Controller {
  static targets = [
    // Each one of the `template` elements containing invitation pages
    'pageTemplate',
    // Attachment point for pages
    'pageAttachment',
    // Navigation Menu
    'menu'
  ]

  pageNavigator = null

  connect () {
    this.pageNavigator = new Navigator(this.pageTemplateTargets, this.pageAttachmentTarget)

    this.navigateTo({
      params: { pageName: this.#renderedInPhone() ? 'cover' : 'welcome' }
    })

    this.dispatch('connected', { detail: { controller: this } })
  }

  /**
   * Returns true if card is rendered in a mobile device. Phone devices
   * have a width of less than 680px, the breakpoint width used by
   * tailwindCSS to differentiate between phones and tables
   * @returns {boolean}
   */
  #renderedInPhone () {
    return window.innerHeight <= 680
  }

  async revealMenu () {
    await Animator.play(
      Animator.animation({
        targets: Array.from(this.menuTarget.children),
        ...MENU_REVEAL_ANIMATION
      })
    )
  }

  navigateTo ({ params: { pageName } }) {
    this.pageNavigator.navigateTo(pageName)
  }
}
