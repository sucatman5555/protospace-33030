Rails.application.routes.draw do
  devise_for :users
  # get 'prototypes/index'
  root to: "prototypes#index"
  # 2020/12/28 add S.Shimada
  # resourcesを用いて、上記で設定したnewアクションとcreateアクションに対するルーティングをroutes.rbに記述した。
  # resources :prototypes, only: [:new, :create,]
  # showアクションのルーティングを設定
  # resources :prototypes, only: [:new, :create, :show]
  # edit、updateアクションのルーティングを設定
  # resources :prototypes, only: [:new, :create, :show, :edit, :update]
  # 削除機能用のルーティングを設定
  # resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy]
  # //2020/12/28 add S.Shimada

  # 2020/12/29 add S.Shimada コメント機能のルーティングを設定
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
    # doとendで挟むことにより、ルーティングの記述をネストさせることができました。
    # この記述によって、「ある投稿に対してのコメント」という親子関係を表現したパスが、
    # コメント投稿に必要なリクエストのパスになります。
    resources :comments, only: :create
    # いいね機能実装用のルーティング
    resources :likes, only: [:create, :destroy]
    # 検索機能の実装
    collection do
      get 'search'
    end
  end
  # //2020/12/29 add S.Shimada コメント機能のルーティングを設定

  # 2020/12/29 add S.Shimada ユーザーに関するshowアクションのルーティングを設定
  # My-carDページ用に追加
  resources :users, only: [:new, :edit, :show]
  # //2020/12/29 add S.Shimada ユーザーに関するshowアクションのルーティングを設定

  # 2020/12/25 add S.Shimada【解決策】deviseのログアウト機能でのエラー
  # routesが合っていないのが原因なので、書き換えないといけない。
  # 以下のコードを追加する。このコードは既存のログアウトルーティングに上書きされる。
  # ※application.html.erb側の変更は特になし
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # //2020/12/25 add S.Shimada【解決策】deviseのログアウト機能でのエラー
end