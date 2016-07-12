Rails.application.routes.draw do
  get 'students/show'

  devise_for :users
  resources 'users'
  resources 'student_group'
  resources 'students'
  resources 'student_notes'
  root 'static_pages#home'
end
