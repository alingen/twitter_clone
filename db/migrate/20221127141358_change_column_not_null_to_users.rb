class ChangeColumnNotNullToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :is_deleted, :boolean, default: false, null: false
  end
end
