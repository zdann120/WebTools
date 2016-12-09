class CreateServiceRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :service_requests do |t|
      t.string :token
      t.string :aasm_state
      t.references :user, foreign_key: true
      t.string :subject
      t.text :message
      t.boolean :urgent, default: false

      t.timestamps
    end
    add_index :service_requests, :token, unique: true
  end
end
