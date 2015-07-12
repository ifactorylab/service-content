class Site < ActiveRecord::Base
  has_one :business
  has_one :style
  has_many :pages
  has_many :categories

  def readonly?
    true
  end

  def to_h
    if pages.count == 0
      # If there's no page exist, we need to generate them
      pages << Page.create(
        :site_id => id,
        :order => 0,
        :title => "FOOD & DRINK",
        :description => "ph. 075 6542 8714")
      pages << Page.create(
        :site_id => id,
        :order => 1,
        :title => "OUR MENU",
        :description => "Seasonal and simple food done well.")
      pages << Page.create(
        :site_id => id,
        :order => 2,
        :title => "RESERVATION",
        :description => "We accept a limited number of reservations up to one month in advance for parties of up to ten guests.")
      pages << Page.create(
        :site_id => id,
        :order => 3,
        :title => "CONTACT US",
        :description => "")
    end

    hash = self.attributes.merge({ business: business.to_h,
                                   pages: pages.sort { |a,b| a.order <=> b.order }.map { |p| p.to_h },
                                   description: self.description.split("\n").reject{ |n| n == "" },
                                   style: self.style ? self.style.to_h : nil,
                                   products: self.categories.map { |c| c.to_h }
                                  }).except("description")
  end
end
