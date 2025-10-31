class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.bigint :client_id
      t.string :name
      t.string :event_type
      t.date :start_date
      t.date :end_date
      t.string :address
      t.string :state

      t.timestamps
    end
  end


end
