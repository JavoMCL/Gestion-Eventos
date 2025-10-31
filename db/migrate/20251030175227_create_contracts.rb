class CreateContracts < ActiveRecord::Migration[8.0]
  def change
    create_table :contracts do |t|
      t.references :event, null: false, foreign_key: true
      t.string :contract_number
      t.date :contract_date
      t.decimal :amount, precision: 12, scale: 2
      t.string :state

      t.timestamps
    end
  end
end
