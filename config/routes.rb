Rails.application.routes.draw do


  # Root
  root 'pages#home'

  # Devise
  devise_for :users, path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register' }

  # Projects 
  resources :projects do
    collection { post :send_bulk }
    resources :contacts
    resources :campaigns
  end

 
end
