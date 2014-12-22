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
    resources :contacts do
      resources :messages
    end
    resources :campaigns
  end

  # Incoming Messages
  post 'incoming_message_webhook' => 'twilio#incoming_message'
 
end
