class Origins < ActiveRecord::Migration[5.2]
  def change
    create_table :origins do |t|
      t.string :location
      t.references :phone_number
    end
  end
end