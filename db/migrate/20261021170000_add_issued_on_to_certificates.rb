class AddIssuedOnToCertificates < ActiveRecord::Migration[7.0]
  def change
    add_column :certificates, :issued_on, :date
  end
end
