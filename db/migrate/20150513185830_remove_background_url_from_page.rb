class RemoveBackgroundUrlFromPage < ActiveRecord::Migration
  def change
    remove_column :pages, :background_url
  end
end
