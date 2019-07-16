class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string      :name, null:false
      t.string      :category, null: false, default: "その他"
      t.integer     :quantity, null: false
      t.date        :expiration_date, null: false
      t.references  :user, null: false, foreign_key: true
      t.timestamps  null: false
    end
  end
end
