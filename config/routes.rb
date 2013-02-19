Skyfall::Application.routes.draw do


  # household
  get "household_account_categories/list"
  get "household_account_categories/edit"
  get "household_account_categories/new"
  get "household_account_categories/show"
  get "household_account_payments/list"
  get "household_account_payments/new"
  get "household_account_payments/edit"
  get "household_account_payments/show"
  get "household_account/list"


  # notes
  get "notes/list"
  get "notes/new"
  get "notes/show"
  get "notes/edit"
  get "notes/destroy"
  get "notes/as_text", :format => 'text'

  # users
  get "users/list"
  get "users/show"
  get "users/new"
  get "users/edit"
  get "users/change_password"
  post "users/change_password_do"

  #settings
  get "settings/list"

  #session
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  #get "sessions/new"
  #get "home/show"

  root :to => "home#show"
  
  # Generated routes with lowest prio
  resources :sessions
  resources :users
  resources :notes
  resources :household_account_categories
  resources :household_account_payments

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
