Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  get 'hello/index' => 'hello#index'
  get 'chats/:chat_id/likes' => 'likes#create'
  get 'chats/:chat_id/likes/:id' => 'likes#destroy'
  
  resources :chats do
  resources :likes, only: [:create, :destroy]
 end
 resources :users, only: [:show] # ユーザーマイページへのルーティング
 root 'hello#index'
end
