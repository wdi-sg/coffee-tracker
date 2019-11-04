class CreateKopis < ActiveRecord::Migration[5.2]
  def change
    create_table :kopis do |t|
      t.string :name
      t.references :roast
      t.references :origin
      t.integer :price
      t.timestamps
    end
  end
end
