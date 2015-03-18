class AddDescriptionToSite < ActiveRecord::Migration
  def change
    add_column :sites, :description, :text, default: ""
  end
end
