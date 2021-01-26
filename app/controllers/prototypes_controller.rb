class PrototypesController < ApplicationController
  # 2020/12/29 add S.Shimada
  # ログインしていない状態だと特定のページへのアクセスが制限され、
  # ログインページにリダイレクトする
  before_action :authenticate_user!
  # //2020/12/29 add S.Shimada

  # 2020/12/29 add S.Shimada アクセス制御1-1
  before_action :move_to_index, only: [:edit]
  # //2020/12/29 add S.Shimada アクセス制御1-1

  def index
    # 2020/12/28 add S.Shimada 03
    # indexアクションに、インスタンス変数@prototypesを定義し、すべてのプロトタイプの情報を代入した
    # @prototypes = Prototype.all
    # N+1問題の対応
    @prototypes = Prototype.includes(:user)
    # //2020/12/28 add S.Shimada 03
  end
  # 2020/12/28 add S.Shimada 01
  def new
    # newアクションにインスタンス変数@prototypeを定義し、Prototypeモデルの新規オブジェクトを代入した
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      # createアクションにデータ保存のための記述をし、保存されたときはルートパスに戻るような記述をした
      redirect_to root_path
    else
      # createアクションに、データが保存されなかったときは新規投稿ページへ戻るようrenderを用いて記述した
      render :new
    end
  end
  # //2020/12/28 add S.Shimada 01

  # 2020/12/28 add S.Shimada 03
  def show
    # showアクションにインスタンス変数@prototypeを定義した。且つ、Pathパラメータで送信されるID値で、
    # Prototypeモデルの特定のオブジェクトを取得するように記述し、それを@prototypeに代入した
    @prototype = Prototype.find(params[:id])
  # 2020/12/29 add S.Shimada
  # prototypes/show.html.erbでform_withを使用して、comments#createを実行するリクエストを飛ばしたいので、
  # @comment = Comment.newというインスタンス変数を生成しておかないといけません。
  # prototypesテーブルとcommentsテーブルはアソシエーションが組まれているので、
  # @prototype.commentsとすることで、@prototypeへ投稿されたすべてのコメントを取得できます。
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  # //2020/12/29 add S.Shimada
  end
  # //2020/12/28 add S.Shimada 03
  # 2020/12/28 add S.Shimada 04 edit updateを追加（編集機能）
  def edit
    @prototype = Prototype.find(params[:id])
  end
  # このupdateアクションも、destroyアクションと同様に、
  # ＠→インスタンス変数にしないと判定文が正常に動作しない。
  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      # 詳細画面に遷移
      redirect_to prototype_path(@prototype.id)
    else
      # 空欄があると編集画面にとどまる。
      render :edit
    end
  end
  # //2020/12/28 add S.Shimada 04
  # 2020/12/28 add S.Shimada 05 削除機能
  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end
  # //2020/12/28 add S.Shimada 05
  
  # 2020/12/28 add S.Shimada 02
  private
  def prototype_params
    # prototypesコントローラーのprivateメソッドにストロングパラメーターをセットし、
    # 特定の値のみを受け付けるようにした。且つ、user_idもmergeした
    params.require(:prototype).permit( :title, :catch_copy, :concept, :image, :item).merge(user_id: current_user.id)
  end
  # //2020/12/28 add S.Shimada 02
  # 2020/12/29 add S.Shimada アクセス制御1-2
  def move_to_index
    prototype = Prototype.find(params[:id])
    unless user_signed_in? && current_user.id == prototype.user_id
      redirect_to action: :index
    end
  end
  # //2020/12/29 add S.Shimada アクセス制御1-2
end
