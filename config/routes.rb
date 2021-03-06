Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :departments
  resources :positions
  resources :applicants
  scope :profile do
    resources :users
  end

  namespace :api do
    mount_devise_token_auth_for 'User', at: '/v1/auth'
    namespace :v1 do
      resources :departments
      resources :positions
      resources :applicants
      namespace :profile do
        resources :users
      end
    end
  end
end
