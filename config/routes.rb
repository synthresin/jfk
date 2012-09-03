Jfk::Application.routes.draw do
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
    resources :users
    resources :sessions, :only => [:new, :create, :destroy]

    resources :notices

    resources :boards do
      resources :posts
    end

    # #routing test
    # match '/write/:board_id', :to =>'posts#new'
    # match '/write/:board_id', :to =>'posts#index'
    
    # match '/notice',        :to =>'posts#index',  :board_id => 1, :as => :notices,    :via => 'get'
    # match '/notice/write',  :to =>'posts#new',    :board_id => 1, :as => :new_notice
    # match '/notice',        :to =>'posts#create', :board_id => 1, :as => :notices,    :via => 'post'
    # match '/notice/:id',    :to =>'posts#show',   :board_id => 1, :as => :notice





    match '/signup',  :to => 'users#new'
    match '/signin',  :to => 'sessions#new'
    match '/signout', :to => 'sessions#destroy'

    match 'companys/:id' => 'users#show'
    match 'admin/companies/new' => 'admin/users#new', :as => :new_admin_company
    
    match 'admin/companies/:id' => 'admin/users#show', :as => :admin_company
    match 'admin/companies' => 'admin/users#create', :as => :admin_companies, :via => 'post'
    match 'admin/companies' => 'admin/users#index', :as => :admin_companies, :via => 'get'



    namespace :admin do  
       resources :users
    end



  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
