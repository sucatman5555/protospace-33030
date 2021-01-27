class AddImpressionsCountToPrototypes < ActiveRecord::Migration[6.0]
  def change
    add_column :prototypes, :impressions_count, :integer, default: 0
  end
end
