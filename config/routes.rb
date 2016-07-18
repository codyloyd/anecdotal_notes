Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources 'users'
  resources 'student_group'
  resources 'students'
  resources 'student_notes'
  root 'static_pages#home'
  get 'tags/:id/:tag', to: 'students#show', as: :tag
  get '/:student_group', to: 'static_pages#home', as: :student_group_homepage
end
