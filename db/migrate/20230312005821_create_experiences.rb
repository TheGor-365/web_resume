class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :company
      t.text :overview
      t.integer :cpe
      t.datetime :start_at
      t.datetime :end_at
      t.string :image

      t.timestamps
    end
  end
end
