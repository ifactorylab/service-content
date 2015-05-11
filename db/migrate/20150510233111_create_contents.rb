class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents, id: :uuid do |t|
      t.string :page_id
      t.integer :order
      t.string :title
      t.text :description
      t.string :image_url

      t.timestamps null: false
    end
  end
end
