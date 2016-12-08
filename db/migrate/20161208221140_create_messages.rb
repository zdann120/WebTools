class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :subject
      t.text :message
      t.string :token
      t.boolean :important, default: false

      t.timestamps
    end
    add_index :messages, :token, unique: true
  end
end
