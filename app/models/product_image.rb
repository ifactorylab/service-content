class ProductImage < ActiveRecord::Base
  mount_uploader :image, ProductUploader
  belongs_to :product

  def readonly?
    true
  end

  def to_h
    self.attributes.merge({
      very_large_url: self.image.very_large.url,
      large_url: self.image.large.url,
      small_url: self.image.small.url,
      url: self.image.url
    }).except("product_id", "image_id", "image_name")
  end
end
