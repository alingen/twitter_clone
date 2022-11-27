class RenameContentToText < ActiveRecord::Migration[6.0]
  def change
    rename_column :tweets, :content, :text
  end
end
