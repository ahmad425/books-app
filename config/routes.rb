Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:index] do
    collection do
      post :assign_tag
    end
  end
  root 'books#index'
end
