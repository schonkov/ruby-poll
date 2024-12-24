import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
// application.debug = false
application.debug = true
window.Stimulus = application

console.log("Hello from Application.js!"); // Debugging message
export { application }
