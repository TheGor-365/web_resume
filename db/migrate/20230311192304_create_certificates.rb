class CreateCertificates < ActiveRecord::Migration[7.0]
  def change
    create_table :certificates do |t|
      t.string :title
      t.string :image
      t.string :school

      t.timestamps
    end
  end
end
