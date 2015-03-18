class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites, id: :uuid do |t|
      t.string :domain
      t.string :partner_id
      t.string :layout_id
      t.string :status

      t.timestamps null: false
    end
  end
end
