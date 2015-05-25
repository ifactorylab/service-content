class Product < ActiveRecord::Base
  belongs_to :site
  belongs_to :category
  mount_uploader :image, ProductUploader
  has_many :product_images

  def readonly?
    true
  end

  def to_h
    self.attributes.merge({
      category: self.category.name,
      images: product_images.map { |i| i.to_h },
      image: {
        very_large_url: image.very_large.url,
        large_url: image.large.url,
        small_url: image.small.url,
        url: image.url
      }
    }).except("category_id", "site_id")
  end
end
