import { Controller } from '@hotwired/stimulus'
import Swiper from 'swiper/bundle'

export default class extends Controller {
  static targets = ['slider']

  connect () {
    this.#initializeSlider()
  }

  #initializeSlider () {
    this.swiper = new Swiper('.swiper', { autoplay: { delay: 3000 }, spaceBetween: 20, pagination: { el: '.swiper-pagination' } })
  }
}
