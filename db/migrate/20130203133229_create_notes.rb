class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :note_id
      t.text :note_text

      t.timestamps
    end
  end
end
