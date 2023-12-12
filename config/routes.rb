Rails.application.routes.draw do

  devise_for :users

  root to: "homes#top"

  resources :calendars, only: [:index]
  resources :schedules do
    resource :marks, only: [:create, :destroy]
    resources :reflections do
      resources :reflection_tag, only: [:create, :destroy]
    end
  end

  # get 'schedules/:date/date_index', to:'schedules#date_index', as: :date_schedules
  # get 'schedules/:date/date_new', to:'schedules#date_new', as: :new_date_schedules


  get 'schedules/search' , to:'schedules#search'
  get 'reflections/search' , to:'reslections#search'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
