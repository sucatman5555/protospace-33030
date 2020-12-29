class Comment < ApplicationRecord
  # 2020/12/29 add S.Shimada バリデーションを設定
  validates :text, presence: true
  # //2020/12/29 add S.Shimada バリデーションを設定
  # 2020/12/29 add S.Shimada commentsモデルにアソシエーション記述した
  belongs_to :prototype
  belongs_to :user
  # //2020/12/29 add S.Shimada commentsモデルにアソシエーション記述した
end
