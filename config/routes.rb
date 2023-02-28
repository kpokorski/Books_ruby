Rails.application.routes.draw do
  scope path: "/api/v1" do
    resources :authors
    resources :books
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
