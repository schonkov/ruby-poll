import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar"]

  connect() {
    console.log("Layout controller connected!");
    console.log("Sidebar target:", this.hasSidebarTarget);

    if (this.hasSidebarTarget) {
      console.log("Sidebar target found!", this.sidebarTarget);

      if (localStorage.getItem("sidebar-collapsed")) {
        this.sidebarTarget.classList.add("collapsed");
      }
    } else {
      console.error("Sidebar target not found!");
    }
  }

  toggleSidebar() {
    console.log("Toggle sidebar clicked");

    if (this.hasSidebarTarget) {
      this.sidebarTarget.classList.toggle("collapsed");

      if (this.sidebarTarget.classList.contains("collapsed")) {
        localStorage.setItem("sidebar-collapsed", "true");
      } else {
        localStorage.removeItem("sidebar-collapsed");
      }
    } else {
      console.error("Sidebar target missing when toggling!");
    }
  }

  toggleTheme() {
    console.log("Toggle theme clicked");

    const htmlElement = document.documentElement;
    const currentTheme = htmlElement.getAttribute("data-bs-theme");
    const newTheme = currentTheme === "dark" ? "light" : "dark";

    htmlElement.setAttribute("data-bs-theme", newTheme);
    localStorage.setItem("theme", newTheme);

  }

  applyTheme() {
    const savedTheme = localStorage.getItem("theme") || "dark";

    document.documentElement.setAttribute("data-bs-theme", savedTheme);

    if (this.hasSidebarTarget) {
      this.sidebarTarget.setAttribute("data-bs-theme", savedTheme);
    }

  }
}