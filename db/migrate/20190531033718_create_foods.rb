class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string      :name, null: false, index: true
      t.references  :category, null: false, foreign_key: true
      t.integer     :quantity, null: false
      t.string      :expiration_date, null: false, default: 3
      t.references  :user, null: false, foreign_key: true
      t.timestamps  null: false
    end
  end
end
