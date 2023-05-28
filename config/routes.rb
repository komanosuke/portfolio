Rails.application.routes.draw do
  root to: 'home#index'

  get '/', to: 'home#index'
  get 'index', to: 'main#index'

  get '/admin_login', to: 'admin_sessions#new'
  post '/admin_login', to: 'admin_sessions#create'
  delete '/admin_logout', to: 'admin_sessions#destroy'

  get 'home/terms', to: 'home#terms'
  get 'home/policy', to: 'home#policy'

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  get 'users/confirm', to: 'users#confirm'
  post 'users/confirm', to: 'users#confirm'
  get 'users/back', to: 'users#back'
  post 'users/back', to: 'users#back'
  get 'signup_done', to: 'users#signup_done'
  get 'success', to: 'users#success'
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  get 'password_resets/mail_done'
  get 'password_resets/success'

  resources :works
  resources :work_cats
  resources :articles
  resources :article_cats
  resources :news
  resources :news_cats
  resources :cart_works
  post 'cart_works/delete', to: 'cart_works#delete'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'admin', to: 'main#admin'
  get 'admin_view', to: 'main#admin_view'
  post 'delete', to: 'main#delete'
  get 'concept', to: 'main#concept'
  get 'purchase', to: 'main#purchase'
  get 'thanks', to: 'main#thanks'
  get 'help', to: 'main#help'
  get 'terms', to: 'main#terms'
  get 'policy', to: 'main#policy'

  get 'example', to: 'examples#index'
  get 'cost', to: 'examples#cost'
  get 'doraemon', to: 'doraemon#doraemon'
  post 'doraemon', to: 'doraemon#doraemon'
  get 'manga', to: 'examples#manga'
  get 'english_grade1', to: 'examples#english_grade1'
  get 'media', to: 'examples#media'

  get 'socket', to: 'socket#socket'
  get 'send_msg', to: 'socket#send_msg'

  get 'followers', to: 'social_media#followers'
  get 'followed', to: 'social_media#followed'
  resources :posts do
    resource :likes, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]

  get 'studies', to: 'studies#index'
  get 'japanese', to: 'studies#japanese'
  get 'math', to: 'studies#math'
  get 'social', to: 'studies#social'
  get 'science', to: 'studies#science'
  get 'english', to: 'studies#english'
  get 'kanji1', to: 'studies#kanji1'
  get 'kanji2', to: 'studies#kanji2'
  get 'kanji3', to: 'studies#kanji3'
  get 'kanji4', to: 'studies#kanji4'
  get 'kanji5', to: 'studies#kanji5'
  get 'kanji6', to: 'studies#kanji6'
  get 'collection', to: 'studies#collection'

  get 'contact', to: 'contacts#new'
  resources :contacts, only: [:create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'contacts/done', to: 'contacts#done', as: 'done'

end
