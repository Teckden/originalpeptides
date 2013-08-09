CartTemplate::Application.routes.draw do

  scope '/blog' do
    resources :posts
    get 'edit_meta_tags', to: 'default_meta_tags#edit_meta_tags_for_blog'
  end
  resources :delivery_details, except: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :orders
  resources :cart_products
  resources :carts
  resources :products
  resources :default_meta_tags, only: [:index, :show, :edit, :update]

  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  delete 'blog_admin_logout', to: 'posts#blog_admin_logout'
  get 'else', to: 'backend#else'

  get 'info', to: 'store#delivery_info', as: 'delivery_info'
  get 'empty_cart', to: 'store#empty_cart', as: 'empty_cart'
  get "/:custom_url" => 'store#show', as: 'show_item'
  root to: 'store#index', as: 'store'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
