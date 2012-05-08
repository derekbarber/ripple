Ripple::Application.routes.draw do
  match '/schedule_pending',  to: 'schedule_student#schedule_pending'
  match '/schedule_multiple',  to: 'schedule_student#schedule_multiple'
  match '/view_pending',      to: 'schedule_student#view_pending'
  match '/view_tentative',     to: 'schedule_student#view_tentative'
  match '/confirm_tentative',   to: 'schedule_student#confirm_tentative'
  match '/view_schedule',     to: 'schedule_student#view_schedule'
  match '/view_teacher_schedule',     to: 'schedule_student#view_teacher_schedule'

  match '/next_steps', to: 'resound_process#next_steps'
  match '/follow_up_calls', to: 'resound_process#follow_up_calls'

  resources :preferred_teachers
  resources :student_availabilities

  resources :teacher_availabilities
  resources :lessons

  resources :teachers
  resources :teacher_instruments

  resources :instruments

  resources :students
  resources :student_instruments

  resources :families

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

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
  root :to => 'sessions#new'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
