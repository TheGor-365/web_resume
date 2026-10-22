Rails.application.routes.draw do
  # Optional locale segment: existing route names and URLs still work.
  scope "(:locale)", locale: /ru|en|hy/ do
    root 'pages#home'
  
    resources :messages
    resources :experiences
  
    get 'letter',          to: 'pages#letter',                as: 'letter'
    get 'resume',          to: 'pages#resume',                as: 'resume'
    get 'projects',        to: 'pages#projects',              as: 'projects'
    get 'certificates',    to: 'pages#certificates',          as: 'certificates'
    get  'contact_email', to: 'contact_mail#new',    as: 'contact_email'
    post 'contact_email', to: 'contact_mail#create', as: 'send_contact_email'
    get 'services',       to: 'pages#services',              as: 'services'
    get 'contacts',       to: 'pages#contacts',              as: 'contacts'
    get 'exercises',       to: 'pages#exercises',             as: 'exercises'
    get 'timeline',        to: 'experiences#timeline',        as: 'timeline'
    get 'experience_data', to: 'experiences#experience_data', as: 'experience_data'
  end
end
