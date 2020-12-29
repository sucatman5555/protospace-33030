class Prototype < ApplicationRecord
  # 2020/12/28 add S.Shimada バリデーションを設定
  # Prototypeモデルに、プロトタイプの名称、キャッチコピー、コンセプト、画像に関するバリデーションを記述した
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  # //2020/12/28 add S.Shimada バリデーションを設定

  # 2020/12/28 add S.Shimada Userモデルにアソシエーション記述した
  belongs_to :user
  # //2020/12/28 add S.Shimada Userモデルにアソシエーション記述した

  # 2020/12/28 add S.Shimada Prototypeモデルに、has_one_attachedを使用してimageカラムとのアソシエーションを記述した
  has_one_attached :image
  # //2020/12/28 add S.Shimada Prototypeモデルに、has_one_attachedを使用してimageカラムとのアソシエーションを記述した

  # 2020/12/29 add S.Shimada コメント機能の追加によりアソシエーションを追記
  has_many :comments
  
  # dependent: :destroyを指定すると、prototypesテーブルのレコードが削除された場合、
  # 関連しているcommentsテーブルのレコードも同時にdestroyメソッドが実行され、一緒に削除される
  has_many :comments, dependent: :destroy
  # //2020/12/29 add S.Shimada コメント機能の追加によりアソシエーションを追記
end