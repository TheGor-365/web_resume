Rails.application.routes.draw do
  root 'pages#home'

  get 'letter',          to: 'pages#letter',           as: 'letter'
  get 'resume',          to: 'pages#resume',           as: 'resume'
  get 'projects',        to: 'pages#projects',         as: 'projects'
  get 'exercises',       to: 'pages#exercises',        as: 'exercises'
  get 'certificates',    to: 'pages#certificates',     as: 'certificates'
end
