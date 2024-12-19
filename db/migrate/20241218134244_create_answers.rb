class CreateAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :answers do |t|
      t.references :poll, null: false, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
