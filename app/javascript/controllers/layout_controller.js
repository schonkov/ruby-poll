// app/javascript/controllers/layout_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar", "themeToggle"]

  connect() {
    console.log("AAAA");
    console.log("Hello from Layout Controller!"); // Debugging message
    // Check localStorage for sidebar state
    if (localStorage.getItem("sidebar-collapsed")) {
        this.sidebarTarget.classList.add("collapsed")
    }

    // Check for theme preference
    if (this.isLightTheme()) {
      this.toggleThemeClass()
    }
  }

  // Toggle sidebar visibility
  toggleSidebar() {
    const sidebar = this.sidebarTarget
    sidebar.classList.toggle("collapsed")

    // Save state in localStorage
    if (sidebar.classList.contains("collapsed")) {
      localStorage.setItem("sidebar-collapsed", "true")
    } else {
      localStorage.removeItem("sidebar-collapsed")
    }
  }

  // Toggle theme between dark and light
  toggleTheme() {
    this.toggleLocalStorage()
    this.toggleThemeClass()
  }

  toggleThemeClass() {
    const current = document.documentElement.getAttribute('data-bs-theme')
    const inverted = current === 'dark' ? 'light' : 'dark'
    document.documentElement.setAttribute('data-bs-theme', inverted)
  }

  toggleLocalStorage() {
    if (this.isLightTheme()) {
      localStorage.removeItem("light")
    } else {
      localStorage.setItem("light", "set")
    }
  }

  isLightTheme() {
    return localStorage.getItem("light")
  }
}
