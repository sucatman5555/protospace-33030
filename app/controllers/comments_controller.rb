class CommentsController < ApplicationController
  # 2020/12/29 add S.Shimada createアクションを定義
  def create
    # Comment.create(comment_params)
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype) # このようにPrefixでパスを指定することが望ましいです。
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show" # views/prototypes/show.html.erbのファイルを参照しています。
    end
  end

  private
  def comment_params
    # user_idカラムには、ログインしているユーザーのidとなるcurrent_user.idを保存し、
    # tweet_idカラムは、paramsで渡されるようにするので、params[:tweet_id]として保存しています。
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
  # //2020/12/29 add S.Shimada createアクションを定義
end
