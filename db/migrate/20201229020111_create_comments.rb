class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      ## 2020/12/29 add S.Shimada commentsテーブルのカラム追加
      # マイグレーションファイルに、textカラムを追加した
      t.text   :text,               null: false
      # マイグレーションファイルに、user,prototypeを参照するための外部キーを記述した（references型を用いる）
      # user,prototypeには、foreign_key: trueの制約をつける。この制約をつけることにより、
      # 外部キー（user_id,prototype_id）がないとDBに保存できないようにします。※エラーを防ぐ
      t.references :user,           foreign_key: true
      t.references :prototype,      foreign_key: true
      ## //2020/12/29 add S.Shimada commentsテーブルのカラム追加 
      t.timestamps
    end
  end
end
