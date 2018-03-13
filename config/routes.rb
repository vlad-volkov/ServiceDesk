Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'tickets#index'

  get "/admin" => "admin/users#index"
  namespace :admin do
    resources :users, only: [:index]
  end

  scope "(:locale)", locale: /en/ do
    resources :tickets do
      resources :comments
    end
  end

  get '/:locale' => 'tickets#index'


end
