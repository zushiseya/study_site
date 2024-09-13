Rails.application.routes.draw do
  # 管理者用のDeviseルート設定
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :comments, only: [:index, :destroy]
    resources :posts, only: [:index, :show, :destroy]
    resources :groups, only: [:index, :show, :destroy]
  end

  # 一般ユーザー用のルート設定
  scope module: :public do
    # Deviseのルート設定
    devise_for :users

    # ルート定義
    root to: 'homes#top'

    # 静的ページ
    get 'homes/about', to: 'homes#about', as: :about

    # 投稿とコメントのリソース
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end

    # ユーザーのリソース
    resources :users, only: [:index, :show, :edit, :update,]

    #グループのリソース
    resources :groups do
      resources :memberships, only: [:create, :destroy]
    end

    #ゲストユーザー用のルート設定
      devise_scope :user do
      post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
    end
  end

  # 検索ページ
  get 'search' => "searches#search"
end
