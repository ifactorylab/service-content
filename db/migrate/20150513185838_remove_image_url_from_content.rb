class RemoveImageUrlFromContent < ActiveRecord::Migration
  def change
    remove_column :contents, :image_url
  end
end
