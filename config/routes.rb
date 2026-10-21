Rails.application.routes.draw do
  root "pages#home"

  # All public pages are read-only. Admin CRUD routes require a separate
  # authenticated interface and are intentionally not exposed.
  get "letter",          to: "pages#letter",                as: "letter"
  get "resume",          to: "pages#resume",                as: "resume"
  get "projects",        to: "pages#projects",              as: "projects"
  get "certificates",    to: "pages#certificates",          as: "certificates"
  get "exercises",       to: "pages#exercises",             as: "exercises"
  get "timeline",        to: "experiences#timeline",        as: "timeline"
  get "experience_data", to: "experiences#experience_data", as: "experience_data"
end
