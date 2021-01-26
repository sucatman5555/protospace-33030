class AddItemToPrototypes < ActiveRecord::Migration[6.0]
  def change
    add_column :prototypes, :item, :string
  end
end
