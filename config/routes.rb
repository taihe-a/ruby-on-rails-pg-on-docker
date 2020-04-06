Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks do
    collection do
      get 'search' => 'tasks#search'
    end
  end
end
