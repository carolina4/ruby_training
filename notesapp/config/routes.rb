Rails.application.routes.draw do
  resources :notes
  root to: "notes#index"
  get 'notes/index'
end
