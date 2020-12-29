class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      ## 2020/12/28 add S.Shimada prototypesテーブルのカラム追加
      # マイグレーションファイルに、プロトタイプの名称、キャッチコピー、コンセプトのためのカラムを追加した
      t.string :title,              null: false
      t.text   :catch_copy,         null: false
      t.text   :concept,            null: false
      # マイグレーションファイルに、userを参照するための外部キーを記述した（references型を用いる）
      # userには、foreign_key: trueの制約をつける。この制約をつけることにより、
      # 外部キー（user_id）がないとDBに保存できないようにします。※エラーを防ぐ
      t.references :user,           foreign_key: true
      ## //2020/12/28 add S.Shimada prototypesテーブルのカラム追加 

      t.timestamps
    end
  end
end
