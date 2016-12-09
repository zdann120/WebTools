class ChangeNoteableTypeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :notes, :noteable_type, :string
  end
end
