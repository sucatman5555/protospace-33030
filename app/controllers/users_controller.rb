class UsersController < ApplicationController
  # 2020/12/29 add S.Shimada
  # usersコントローラーにshowアクションを定義
  def show
    # usersコントローラーのshowアクションにインスタンス変数@userを定義した。
    # 且つ、Pathパラメータで送信されるID値で、Userモデルの特定のオブジェクトを取得するように記述し、
    # それを@userに代入した
    @user = User.find(params[:id])
    # ↓だと全ユーザーのデータが取れてしまう
    # @prototypes = Prototype.all
    @prototypes = @user.prototypes
  end
  # //2020/12/29 add S.Shimada
end
