class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :body
      t.string :note_type
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
