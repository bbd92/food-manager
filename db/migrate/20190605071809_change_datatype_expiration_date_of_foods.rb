class ChangeDatatypeExpirationDateOfFoods < ActiveRecord::Migration[5.0]
  def change
    change_column :foods, :expiration_date, :date
  end
end
