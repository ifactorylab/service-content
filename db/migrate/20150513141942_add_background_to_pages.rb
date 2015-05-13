class AddBackgroundToPages < ActiveRecord::Migration
  def change
    add_column :pages, :background, :string
  end
end
