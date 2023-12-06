Rails.application.routes.draw do

  devise_for :users

  root to: "homes#top"

  resources :schedules, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
    resource :marks, only: [:create, :destroy]
  end

  resources :reflections, only: [:index, :new, :show, :edit, :create, :update, :destroy] do
    resources :reflection_tag, only: [:create, :destroy]
  end
  get 'schedules/search' , to:'schedules#search'
  get 'reflections/search' , to:'reslections#search'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
