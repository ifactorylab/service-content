class Category < ActiveRecord::Base
  belongs_to :site
  has_many :products

  def readonly?
    true
  end

  def to_h
    self.attributes.merge({
      items: self.products.map { |p| p.to_h }
    }).except("site_id")
  end
end
