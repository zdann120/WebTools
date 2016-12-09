class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.integer :noteable_id
      t.integer :noteable_type
      t.string :subject
      t.text :message
      t.string :token
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :notes, :token, unique: true
  end
end
