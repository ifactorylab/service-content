class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours, id: :uuid do |t|
      t.string :business_id, null: false
      t.string :day, null: false
      t.integer :start_hour, null: false
      t.integer :end_hour, null: false

      t.timestamps null: false
    end
  end
end
