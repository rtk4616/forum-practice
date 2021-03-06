Rails.application.routes.draw do
  devise_for :users
  ## 前台路由
  # root
  root "posts#index"

  # 使用者
  resources :users, only: [:edit, :update, :show] do
    member do
      get :draft
      get :comment
      get :collect
      get :friend

      # 好友關係
      post :friend_request
      post :friend_accept
      post :friend_ignore
    end
  end

  # 文章
  resources :posts do
    resources :comments, only: [:create, :destroy, :edit, :update]

    # 文章收藏記錄
    member do
      post :collect
      delete :uncollect
    end
  end

  # posts#index 的文章分類按鈕
  resources :categories, only: [:show]

  ## 後台路由
  # 進入後台必須有管理員 (admin) 權限
  namespace :admin do
    # GET /admin/users  後台可以瀏覽所有使用者清單
    # POST  /admin/:id/user   可以更新使用者的身份
    resources :users, only: [:index, :update]
    # 後台可以 CRUD `文章的分類` (但不能刪除已經有被使用的分類)
    resources :categories

    # 後台首頁
    root "users#index"
  end

  # API路由
  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      post "/login" => "auth#login"
      post "/logout" => "auth#logout"

      resources :posts, except: [:edit]
    end
  end

  # Feeds
  resources :feeds, only: [:index]
end
