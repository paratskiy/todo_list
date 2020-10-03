Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get 'projects' => 'projects#index', as: 'projects'
  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
