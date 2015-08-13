Rails.application.routes.draw do

  root 'builds#index'
  get 'sitemap' => 'home#sitemap', format: :xml
  
  devise_for :users,  path_names: { sign_in: 'login', sign_out: 'logout' }  
  resources :users, except:[:index, :new]

  resources :posts do 
    resources :comments, module: :posts
  end
  
  get 'builds/t/:b_type', to: 'builds#index', as: "b_type"
  resources :builds do
    resources :comments, module: :builds
  end
  
  get 'contact_us', to: 'contacts#new'
  resources :contacts, as: 'contacts', only: [:new, :create]
  
  namespace :admin do
    get 'simple_dashboard/index'
    get 'simple_dashboard/posts'
    get 'simple_dashboard/builds'
    get 'simple_dashboard/users'
  end
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'tags/:tag', to: 'posts#index', as: "tag"
  get 'pages/about'
  get 'pages/notes'
  get 'robots' => 'home#robots', format: :text#, defaults: { format: :text }
  get '*path', to: 'application#handle_404'
end
