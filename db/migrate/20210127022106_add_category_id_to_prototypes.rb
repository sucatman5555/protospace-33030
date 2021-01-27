class AddCategoryIdToPrototypes < ActiveRecord::Migration[6.0]
  def change
    add_column :prototypes, :category_id, :integer
  end
end
