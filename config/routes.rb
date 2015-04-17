Rails.application.routes.draw do


  root :to => 'users#index'
  resources :users, only: [:new, :create, :index, :show, :upload]
  get 'signin', to: 'users#signin', as: :signin
  get 'signout', to: 'users#signout', as: :signout
  get 'artists', to: 'artists#index', as: :artists
  post 'signinpost',to: 'users#signinpost', as: :signinpost
  get 'artist', to: 'concerts#artist', as: :artist
  get 'upload', to: 'concerts#upload', as: :upload
  post 'videoupload', to: 'concerts#videoupload', as: :videoupload
  resources :artists, only: [:index]

  # resources :concerts, only: [:show]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end