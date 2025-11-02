class CreateContractDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :contract_details do |t|
      t.references :contract, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price, precision: 12, scale: 2
      t.decimal :subtotal, precision: 12, scale: 2
      t.string :notes

      t.timestamps
    end
  end
end
