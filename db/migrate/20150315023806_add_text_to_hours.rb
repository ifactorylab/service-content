class AddTextToHours < ActiveRecord::Migration
  def change
    add_column :hours, :text, :string, default: ""
  end
end
