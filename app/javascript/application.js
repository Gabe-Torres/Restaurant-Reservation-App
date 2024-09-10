// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "../stylesheets/application.scss"

import { Tooltip, Toast, Popover } from 'bootstrap';

// Initialize tooltips
document.querySelectorAll('[data-bs-toggle="tooltip"]').forEach((element) => {
  new Tooltip(element);
});

// Initialize popovers
document.querySelectorAll('[data-bs-toggle="popover"]').forEach((element) => {
  new Popover(element);
});