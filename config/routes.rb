Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "auths/omniauth_callbacks" }, defaults: { format: :json }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events, :defaults => { :format => 'json' }

end
