class RenameIsClosedToIsPublishedInPolls < ActiveRecord::Migration[8.0]
  def change
    rename_column :polls, :is_closed, :is_published
  end
end
