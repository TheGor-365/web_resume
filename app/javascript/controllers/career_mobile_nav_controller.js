import { Controller } from "@hotwired/stimulus"

// Mobile-only progressive enhancement for Bootstrap Collapse + Rails Turbo Streams.
// Desktop navigation and both Turbo frames remain unchanged.
export default class extends Controller {
  connect() {
    this.pendingTarget = null
    this.readyPanelId = null
    this.awaitingCollapse = false
  }

  disconnect() {
    this.pendingTarget = null
    this.readyPanelId = null
    this.awaitingCollapse = false
  }

  get isMobile() {
    return window.matchMedia("(max-width: 991.98px)").matches
  }

  navigate(event) {
    if (!this.isMobile) return

    const path = new URL(event.currentTarget.href, window.location.href).pathname
    this.pendingTarget = /\/(timeline|experience_data)\/?$/.test(path)
      ? "experience"
      : "toggler"
    this.readyPanelId = null

    const menu = this.element.querySelector("#navbarNav")
    const collapse = window.bootstrap?.Collapse
    this.awaitingCollapse = Boolean(menu?.classList.contains("show") && collapse)

    if (this.awaitingCollapse) {
      menu.addEventListener("hidden.bs.collapse", () => {
        this.awaitingCollapse = false
        this.scrollWhenReady()
      }, { once: true })
      collapse.getOrCreateInstance(menu, { toggle: false }).hide()
    }
    // Do not preventDefault: the existing Turbo request runs normally.
  }

  beforeStreamRender(event) {
    if (!this.isMobile || !this.pendingTarget) return

    const target = event.target.getAttribute("target")
    if (target !== this.pendingTarget || event.target.getAttribute("action") !== "replace") return

    const originalRender = event.detail.render
    event.detail.render = async (streamElement) => {
      await originalRender(streamElement)
      this.readyPanelId = target === "experience"
        ? "career-secondary-panel"
        : "career-primary-panel"
      this.pendingTarget = null
      this.scrollWhenReady()
    }
  }

  scrollWhenReady() {
    if (this.awaitingCollapse || !this.readyPanelId || !this.isMobile) return

    const panelId = this.readyPanelId
    this.readyPanelId = null
    requestAnimationFrame(() => {
      const panel = document.getElementById(panelId)
      if (!panel || !this.isMobile) return

      const reducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches
      panel.scrollIntoView({
        behavior: reducedMotion ? "auto" : "smooth",
        block: "start"
      })
    })
  }
}
