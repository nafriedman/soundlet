Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'pages#home'
  resources :listings, only: [:index, :show, :new, :create] do
    resources :rentals, only: [:new, :create, :edit, :update]
  end
  resources :rentals, only: :index
  get '/users/:user_id/listings', to: 'listings#my_listings', as: :my_listings
  get '/listings/:listing_id/rentals', to: 'rentals#listing_rentals', as: :rentals_by_listing
end
