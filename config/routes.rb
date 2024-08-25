Rails.application.routes.draw do
  # 管理者用のDeviseルート設定
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
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
  end

  # 検索ページ 
  get 'search' => "searches#search"
end
