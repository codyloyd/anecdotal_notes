Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources 'users'
  resources 'student_group'
  resources 'students'
  resources 'student_notes'
  root 'static_pages#home'
  get '/:student_group', to: 'static_pages#home', as: :student_group_homepage
end
