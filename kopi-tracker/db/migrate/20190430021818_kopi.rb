class Kopi < ActiveRecord::Migration[5.2]
  def change
    create_table :kopi do |t|
  t.string :name
  t.string :roast
  t.string :origin
  t.timestamps
end
  end
end