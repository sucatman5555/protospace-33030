class UsersController < ApplicationController
  before_action :current_user_like_count
  # My-carDページ用に追加
  def new
    @user = User.find(current_user.id)
    # 最新の投稿順に並ぶよう一度投稿日順に取得し直す。
    @user_like = @user.liked_prototypes.order("created_at DESC")
  end
  # //My-carDページ用に追加
  # 2020/12/29 add S.Shimada
  # usersコントローラーにshowアクションを定義
  def show
    # usersコントローラーのshowアクションにインスタンス変数@userを定義した。
    # 且つ、Pathパラメータで送信されるID値で、Userモデルの特定のオブジェクトを取得するように記述し、
    # それを@userに代入した
    @user = User.find(params[:id])
    # ↓だと全ユーザーのデータが取れてしまう
    # @prototypes = Prototype.all
    @prototypes = @user.prototypes.order("created_at DESC")
  end
  # //2020/12/29 add S.Shimada

  private

  def current_user_like_count
    # ヘッダーのお気に入り枚数表示用
    if user_signed_in?
      @current_user_like_count = User.find(current_user.id)
    end
  end
end
