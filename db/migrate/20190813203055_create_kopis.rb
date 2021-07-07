class CreateKopis < ActiveRecord::Migration[5.2]
  def change
    create_table :kopis do |t|
      t.text :name
      t.text :price
      
      t.references  :roast
      t.references :farm
      
      t.timestamps
    end
  end
end
