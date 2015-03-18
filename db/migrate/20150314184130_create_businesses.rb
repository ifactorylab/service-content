class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses, id: :uuid do |t|
      t.string :site_id, default: "", null: false
      t.string :name, default: ""
      t.string :email, default: ""
      t.string :phone, default: ""
      t.string :address, default: ""
      t.string :city, default: ""
      t.string :state, default: ""
      t.string :postcode, default: ""
      t.string :country, default: ""

      t.timestamps null: false
    end
  end
end
