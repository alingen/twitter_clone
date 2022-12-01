class AddNotNullToComment < ActiveRecord::Migration[6.0]
  def change
    change_column_null :comments, :user_id, false
    change_column_null :comments, :tweet_id, false
  end
end
