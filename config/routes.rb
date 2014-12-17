Rails.application.routes.draw do

  resources :projects

  root 'pages#home'

  devise_for :users, path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register' }
 
end
