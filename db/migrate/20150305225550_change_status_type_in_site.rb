class ChangeStatusTypeInSite < ActiveRecord::Migration
  def change
    remove_column :sites, :status
    add_column :sites, :status, :integer, default: 0
  end
end
