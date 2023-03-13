class AddNoteExperiences < ActiveRecord::Migration[7.0]
  def change
    add_column :experiences, :note, :string
  end
end
