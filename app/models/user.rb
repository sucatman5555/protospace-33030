class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 2020/12/25 add S.Shimada バリデーションを設定
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
  # //2020/12/25 add S.Shimada バリデーションを設定

  # 2020/12/28 add S.Shimada Userモデルにアソシエーション記述した
  has_many :prototypes
  # //2020/12/28 add S.Shimada Userモデルにアソシエーション記述した
  
  # 2020/12/29 add S.Shimada コメント機能の追加によりアソシエーションを追記
  # has_many :prototypes, through: :comments
  # ↑に設定すると下記のエラーが発生する。
  # ActiveRecord::HasManyThroughAssociationNotFoundError in UsersController#show
  # Could not find the association :comments in model User
  # 【結論】そもそも多：多の関係じゃないため、throughの定義は不要であった。
  has_many :comments
  # //2020/12/29 add S.Shimada コメント機能の追加によりアソシエーションを追記

end