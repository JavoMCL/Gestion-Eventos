class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.string :phone_number
      t.string :email
      t.string :address
      t.timestamps
    end
  end
end
