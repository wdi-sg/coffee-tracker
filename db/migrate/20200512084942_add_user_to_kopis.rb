class AddUserToKopis < ActiveRecord::Migration[6.0]
  def change
    add_reference :kopis, :user, null: false, foreign_key: true
  end
end
