import { Controller } from '@hotwired/stimulus'

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
    'pageAttachment'
  ]

  pageNavigator = null

  connect () {
    this.pageNavigator = new Navigator(this.pageTemplateTargets, this.pageAttachmentTarget)
  }

  navigateTo (pageName) {
    this.pageNavigator.navigateTo(pageName)
  }
}
