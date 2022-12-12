class ChangeColumnNotNullToComment < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :user_id, :string, null: false
    change_column :comments, :tweet_id, :string, null: false
    change_column :comments, :text, :text, null: false
  end
end
