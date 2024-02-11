// Represents an invitation page (welcome, schedule, etc).
export class DeviceRecognizer {
/**
 * Returns true if page is rendered in a mobile device. Phone
 * devices have a width of less than 680px, the breakpoint width
 * used by tailwindCSS to differentiate between phones and tables
 * @returns {boolean}
 */
  static isMobile () {
    return window.innerHeight <= 680
  }
}
