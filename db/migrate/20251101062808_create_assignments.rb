class CreateAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :assignments do |t|
      t.references :event, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.string :role
      t.string :task
      t.string :state

      t.timestamps
    end
  end
end
