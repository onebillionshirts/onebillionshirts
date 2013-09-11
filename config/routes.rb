OneBS::Application.routes.draw do



  get "medias/show"

  get "medias/delete"

  # The priority is based upon order of creation:
  # first created -> highest priority.
  match "/how_it_works", :to => "home#how_it_works"
  match "/participate", :to => "home#participate"
  match "/about", :to => "home#about"
  match "/charities", :to => "charities#index"
  match "/contact", :to => "home#contact"
  match "/our_story", :to => "home#our_story"
  match "/ccc", :to => "home#ccc"
  match "/top_ten_reasons", :to => "home#top_ten_reasons"
  match "/share_contest", :to => "home#share_contest"
  match "/brand", :to => "home#brand"
  match "/client_spotlight", :to => "home#client_spotlight"
  match "/client_slight", :to => "home#client_slight"
  match "/faq", :to => "home#faq"
  match "/calendar", :to => "home#calendar"
  match "/impact", :to => "home#impact"
  match "/socialize", :to => "home#socialize"
  match "/channel", :to => "home#channel"


  devise_for :admins, :controllers => {
      :sessions => "admins/sessions"
  }

  devise_scope :admin do
    get "sign_in" => "admins/sessions#new"
    get "sign_out" => "admins/sessions#destroy"
  end

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

  # Sample resource route within a namespace:
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  namespace :admins do
    resources :orders
    resources :site_events  do
      get :subscribers, :on => :collection
      put :approve, :on => :member
    end
    resource :cost_matrix
    resources :banners
    resources :client_spotlights
    resources :questions
    resources :questions_categories
    resources :posts
    resources :charities do
      member do
        put :approve
      end
      collection do
        get :image_form
        get :pending
      end
    end
    resources :charity_categories
    resources :suggested_charities
    resources :references
    resources :pages
    resources :style_categories
    resources :style_sub_categories
    resources :styles
    resources :shirt_colors
    resources :color_groups
    resources :contests
  end

  resources :home do
    collection do
      get :how_it_works, :participate, :contact, :about, :download, :calculate_value, :calculated_value_popup, :top_ten_reasons, :share_contest, :thank_you, :view_all_charities, :get_questions, :socialize, :channel
      post :send_email
      post :calculate_impact
    end
  end

  resource :events do
    post :subscribers, :on => :collection
    get :thanks, :on => :member
  end

  resources :contests  do
    get :vote, :on => :member
  end

  resources :charities do
    collection do
      get :get_charities, :sort_charities, :details, :request_quote, :image_form, :suggest_charity, :go_to_charity, :count_share
      post :search_charities, :add_charity
    end
  end


  resources :orders do
    collection do
      get :quick_quote
      get :calculate
      get :thankyou
    end
  end

  match "/:id", :to => "charities#show"
  match "/contests/:id", :to => "contests#show"

  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
