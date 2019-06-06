class ChangeDefaulttoNullFood < ActiveRecord::Migration[5.0]
  def change
    change_column_default :foods, :expiration_date, nil
  end
end
