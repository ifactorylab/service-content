class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles, id: :uuid do |t|
      t.string :site_id
      t.string :title
      t.string :logo
      t.string :header_background_color
      t.string :header_title_color
      t.string :footer_background_color
      t.string :footer_title_color

      t.timestamps null: false
    end
  end
end
