Rails.application.routes.draw do

  root 'welcome#index'

  get '/picks/new' => 'picks#new'

  # Default routes for devise
  devise_for :users, :controllers => { registrations: 'registrations' }

  # Adding a few convenience routes
  devise_scope :user do
    get "login", to: "devise/sessions#new"
    get "sign_up", to: "devise/registrations#new"
    get "signup", to: "devise/registrations#new"
  end
end
