class AddPriceToKopis < ActiveRecord::Migration[5.2]
  def change
    add_column :kopis, :price, :float
  end
end
