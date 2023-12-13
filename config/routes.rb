Rails.application.routes.draw do

  devise_for :users

  root to: "homes#top"

  resources :calendars, only: [:index]
  resources :schedules do
    resource :marks, only: [:create, :destroy]
    resources :reflections do
      resources :reflection_tags, only: [:create, :destroy]
    end
  end

  # get 'schedules/:date/date_index', to:'schedules#date_index', as: :date_schedules
  # get 'schedules/:date/date_new', to:'schedules#date_new', as: :new_date_schedules


  get 'schedules/search' , to:'schedules#search'
  get 'reflections/search' , to:'reslections#search'
  
  devise_scope :end_user do
    post 'users/guest_sign_in', to:'sessions#guest_sign_in'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
