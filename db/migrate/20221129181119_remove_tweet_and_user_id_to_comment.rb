class RemoveTweetAndUserIdToComment < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :user_id, :string
    remove_column :comments, :tweet_id, :string
  end
end
