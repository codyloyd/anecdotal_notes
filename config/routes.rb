Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }, path_names: {sign_in: "login", sign_out: "logout"}
  resources 'users'
  resources 'student_group'
  resources 'students'
  resources 'student_notes'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get 'tags/:id/:tag', to: 'students#show', as: :tag
  get '/:student_group', to: 'static_pages#home', as: :student_group_homepage
end
