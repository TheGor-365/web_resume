import { Controller } from "@hotwired/stimulus"

// Mobile-only progressive enhancement for Bootstrap Collapse + Rails Turbo Streams.
// Desktop navigation is deliberately untouched (Bootstrap lg breakpoint).
export default class extends Controller {
  connect() {
    this.pendingTarget = null
  }

  disconnect() {
    this.pendingTarget = null
  }

  get isMobile() {
    return window.matchMedia("(max-width: 991.98px)").matches
  }

  navigate(event) {
    if (!this.isMobile) return

    // Some tabs replace the right Turbo frame, the others replace the left one.
    const path = new URL(event.currentTarget.href, window.location.href).pathname
    this.pendingTarget = /\/(timeline|experience_data)\/?$/.test(path)
      ? "experience"
      : "toggler"

    const menu = this.element.querySelector("#navbarNav")
    if (menu && window.bootstrap?.Collapse) {
      window.bootstrap.Collapse.getOrCreateInstance(menu, { toggle: false }).hide()
    }
    // Do not preventDefault: Turbo performs the original request as before.
  }

  beforeStreamRender(event) {
    if (!this.isMobile || !this.pendingTarget) return

    const target = event.target.getAttribute("target")
    if (target !== this.pendingTarget || event.target.getAttribute("action") !== "replace") return

    const originalRender = event.detail.render
    event.detail.render = async (streamElement) => {
      await originalRender(streamElement)

      const panelId = target === "experience"
        ? "career-secondary-panel"
        : "career-primary-panel"
      this.pendingTarget = null

      requestAnimationFrame(() => {
        if (!this.isMobile) return
        const panel = document.getElementById(panelId)
        if (!panel) return
        const reducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches
        panel.scrollIntoView({
          behavior: reducedMotion ? "auto" : "smooth",
          block: "start"
        })
      })
    }
  }
}
