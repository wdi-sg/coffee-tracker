class CreateRoasts < ActiveRecord::Migration[6.0]
  def change
    create_table :roasts do |t|
      t.string :name

      t.timestamps
    end
  end
end
