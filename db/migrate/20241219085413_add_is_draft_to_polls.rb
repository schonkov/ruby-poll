class AddIsDraftToPolls < ActiveRecord::Migration[8.0]
  def change
    add_column :polls, :is_draft, :boolean, default: true
  end
end
