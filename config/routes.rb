Rails.application.routes.draw do
   devise_for :admin_users, ActiveAdmin::Devise.config
   ActiveAdmin.routes(self) 
  
  root 'products#index'
   
  get "products" => "products#index" 
  
  get "products/:id" => "products#show", constraints:{id:/\d+/}, as: "product"
  
  get "product/categories/:id" => "products#category", constraints:{id:/\d+/}, as: "category"
  
  get "contentpage/:id" => "products#content_page", as: 'link' 
  get 'search_results' => 'products#search_results', as:'search_results'
  get 'radio_results' => 'products#radio_results', as:'radio_results'
 
  post 'favourite_product/:id' =>'products#save_fav_product', as: 'save_fav_product'
  get 'forget_me_bro' =>'products#forget_me_bro', as: 'forget'
  get 'add_to_cart/:id' =>'products#add_to_cart', as: 'add_to_cart'  
  get 'remove_from_cart/:id' =>'products#remove_from_cart', as: 'remove_from_cart'
 
  get 'customer/create_customer' => 'customer#index', as: 'cust_checkout'
    get 'customer/anything' => 'customer#create_customer', as: 'something'
  #get 'customer/create' => 'customer#create', as: 'create'vreate_custome
  get 'customer/preview' => 'customer#preview', as:'preview'
  post 'customer/check_form' => 'customer#preview', as: 'create_customer'
  post 'customer/qty' => 'customer#qty', as: 'qty'
 #get 'order/create_order' =>'order#create', as: 'create_order'
#post 'order/post_order' =>'order#preview', as:'preview'
 # get 'customer/orders' => 'order#create_order', as: 'order'
  #get 'customer/create' => 'customer#create_customer', as: 'customer'
 
  #post 'customer/create_customer' => 'customer#create_customer', as: 'new_customer'
 # post 'order/create_order' => 'order#create_order', as: 'create_order'
  #get 'products/create_line_item' => 'products#create_line_item', as: 'create_line_item' 

end
