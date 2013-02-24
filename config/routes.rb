ShibShibBlastic::Application.routes.draw do

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

    match "new_post" => "posts#new"
    match "profile" => "users#show"
    devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
    devise_scope :user do
     get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
    end

    match "index" => "welcome#index"
    match "mvote" => "welcome#mvote"
    match "about" => "welcome#about"
    match "faq" => "welcome#faq"
    get "welcome/index"
    get "welcome/latest"
    get 'tags/:tag', to: 'posts#index', as: :tag

    resources :welcome
    resources :posts do
      get 'vote'
      get 'mark_inappropriate'
    end

    resources :users
    resources :posts

    root :to => 'welcome#index'
  end

  match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  match '', to: redirect("/#{I18n.default_locale}")

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
