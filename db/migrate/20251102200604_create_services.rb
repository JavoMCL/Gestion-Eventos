class CreateServices < ActiveRecord::Migration[8.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :category
      t.string :description
      t.decimal :base_amount, precision: 12, scale: 2
      t.boolean :active

      t.timestamps
    end
  end
end
