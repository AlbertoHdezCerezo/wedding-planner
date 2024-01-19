import anime from 'animejs'

export class Animator {
  static animation (animationPayload) {
    return anime({
      autoplay: false,
      ...animationPayload
    })
  }

  static async play (animation) {
    animation.play()

    await animation.finished

    return animation
  }
}
