class Like < ApplicationRecord
  belongs_to :prototype
  belongs_to :user
  # いいね機能にバリデーションをつけます。具体的に何をするのかというと、
  # 1人が１つの投稿に対して、１つしかいいねをつけられないようにします。
  # （自分の投稿にもいいねができます)
  # validates_uniqueness_ofによって、prototype_idとuser_id
  # の組が1組しかないようにバリデーションを設定
  validates_uniqueness_of :prototype_id, scope: :user_id
end
