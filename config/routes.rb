Rails.application.routes.draw do
  get 'notes/index'
  get 'notes/new'
  get 'notes/edit'
  get 'notes/show'
  # get 'notebooks/index'
  # get 'notebooks/new'
  # get 'notebooks/edit'
  # get 'notebooks/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "notebooks#index"
  resources :notebooks
  resources :notes
  get "notes/index/:id" => "notes#index", :as => "note_index"
  get "notes/:id/new" => "notes#new", :as => "notebooks_note"

end
