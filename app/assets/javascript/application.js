// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// app/assets/javascript/application.js

import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export { application }

