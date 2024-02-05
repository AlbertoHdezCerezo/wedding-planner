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

  static timeline (animations) {
    const timeline = anime.timeline({ autoplay: false })

    animations.forEach((animation, index) => { timeline.add(animation, '+=0') })

    return timeline
  }

  static async playTimeline (timeline) {
    timeline.play()

    await timeline.finished

    return timeline
  }
}
