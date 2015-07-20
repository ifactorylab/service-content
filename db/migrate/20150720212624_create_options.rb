class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options, id: :uuid do |t|
      t.string :key
      t.string :value
      t.string :content_id

      t.timestamps null: false
    end
  end
end
