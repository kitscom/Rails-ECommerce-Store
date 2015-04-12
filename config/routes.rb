Rails.application.routes.draw do
   devise_for :admin_users, ActiveAdmin::Devise.config
   ActiveAdmin.routes(self)
 
  #READ
  #
  #GET/ Loads the index action of the products controller
  root 'products#index'
   
  get "products" => "products#index" 
  
  get "products/:id" => "products#show", constraints:{id:/\d+/}, as: "product"
  
  get "product/categories/:id" => "products#category", constraints:{id:/\d+/}, as: "category"
  
  get "contentpage/:id" => "products#content_page", as: 'link' 
  get 'search_results' => 'products#search_results', as:'search_results'
  get 'radio_results' => 'products#radio_results', as:'radio_results'
  
  #get 'products/about_us' =>'products#about_us', as: 'about' 
  #get 'products/contact_us' => 'products#contact_us', as: 'contact'
  
  post 'favourite_product/:id' =>'products#save_fav_product', as: 'save_fav_product'
  get 'forget_me_bro' =>'products#forget_me_bro', as: 'forget'
  get 'add_to_cart/:id' =>'products#add_to_cart', as: 'add_to_cart'  
  get 'remove_from_cart/:id' =>'products#remove_from_cart', as: 'remove_from_cart'
 # resources :charges
   get 'products/orders' => 'products#order', as: 'order'
  
get 'product/charges' =>'products#charge', as:'charge'
  
  
  
  
  
  
  
  
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
