class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages, id: :uuid do |t|
      t.string :site_id
      t.integer :order
      t.string :title
      t.string :description
      t.string :background_url

      t.timestamps null: false
    end
  end
end
