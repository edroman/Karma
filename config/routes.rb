Karma::Application.routes.draw do

  root :to => 'main#home'

  resources :users, :only => [:update]
  match "/add_your_email" => "users#add_email", :as => :add_email
  match "/house_rules" => "users#house_rules", :as => :house_rules_user

  resources :queries, :only => [:new, :create] do
    get 'thanks', :on => :collection
  end

  # Omniauth routes
  match "/auth/:provider/callback" => "sessions#create"
  match "/sign_out" => "sessions#destroy", :as => :sign_out
  match "/auth/failure" => "sessions#failure", :as => :authentication_failure

  # RESTful reply routes (MailGun)
  match "/post" => "incoming_mail#post_event"

  resources :sessions, :only => [:create]

  namespace :admin do
    resources :emails
    resources :users
    resources :queries
  end

end

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
# match ':controller(/:action(/:id(.:format)))'