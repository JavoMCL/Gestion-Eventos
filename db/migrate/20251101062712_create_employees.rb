class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :position
      t.string :phone_number
      t.string :email
      t.boolean :active

      t.timestamps
    end
  end
end
