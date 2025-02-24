class CreateNotes < ActiveRecord::Migration[7.2]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :message, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
