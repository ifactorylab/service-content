class ChangeStatusToString < ActiveRecord::Migration
  def change
    remove_column :sites, :status
    add_column :sites, :status, :string, default: "development"
  end
end
