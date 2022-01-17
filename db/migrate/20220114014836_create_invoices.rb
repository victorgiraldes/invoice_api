class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.integer :number
      t.date :date
      t.text :company_info
      t.text :charge_info
      t.monetize :price

      t.timestamps
    end
  end
end
