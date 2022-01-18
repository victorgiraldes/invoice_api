class CreateMailingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :mailing_addresses do |t|
      t.string :email
      t.references :invoice, index: true, foreign_key: true
      t.timestamps
    end
  end
end
