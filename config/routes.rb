Rails.application.routes.draw do

  devise_for :users

  root to: "homes#top"

  resources :calendars, only: [:index]
  resources :schedules do
    resource :marks, only: [:create, :destroy]
    collection do
      get "categories/:id/", to:"categories#show", as: :category
    end
    resources :reflections do
      resources :reflection_tags, only: [:create, :destroy]
    end
  end

  get "/search", to: "searches#search", as: :search
  
  devise_scope :user do
    post "users/guest_sign_in", to:"sessions#guest_sign_in"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
