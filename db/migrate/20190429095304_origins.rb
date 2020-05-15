class Origins < ActiveRecord::Migration[5.2]
  def change
    create_table :origins do |t|
      t.text :name
      t.text :location
      t.text :phone
      t.timestamps
    end
  end
end