Rails.application.routes.draw do
  get 'search/search'
  devise_for :users, controller: {sessions: 'users/sessions', registration: 'users/registration'}
root to: 'homes#top'
get 'home/about' => 'homes#about'
get '/search' => 'search#search'
    # ＃url          controller名　アクション名
resources :users, only: [:index,:show, :edit, :update] do
resource :relationships, only: [:create, :destroy]
get 'followings' => 'relationships#followings', as: 'followings'
get 'followers' => 'relationships#followers', as: 'followers'
end
resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
resource :favorites, only: [:create, :destroy]
resources :book_comments, only: [:create, :destroy]
end

end
