import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  copyToClipboard ({ params: { url } }) {
    navigator.clipboard.writeText(url)
  }
}
