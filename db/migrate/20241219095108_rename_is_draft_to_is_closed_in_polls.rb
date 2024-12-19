class RenameIsDraftToIsClosedInPolls < ActiveRecord::Migration[8.0]
  def change
    rename_column :polls, :is_draft, :is_closed
  end
end
