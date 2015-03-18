class AddAppUrlToSite < ActiveRecord::Migration
  def change
    add_column :sites, :app_url, :string
  end
end
