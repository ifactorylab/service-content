require 'carrierwave/orm/activerecord'

class Page < ActiveRecord::Base
  belongs_to :site
  has_many :contents
  mount_uploader :background, BackgroundUploader

  def to_h
    if contents.count == 0
      if self.order == 0
        # If there's no page exist, we need to generate them
        contents << Content.create(
          :page_id => id,
          :order => 0,
          :title => site.name,
          :description => site.description)
        contents << Content.create(
          :page_id => id,
          :order => 1,
          :title => "Coffee",
          :description => "We use coffee from Cup in Woolloongabba. They roast a seasonal blend just for us and we also offer single origin espresso from them.")
        contents << Content.create(
          :page_id => id,
          :order => 2,
          :title => "Baking",
          :description => "We bake every morning and will always have fresh cakes, pastries and muffins on hand.")
        contents << Content.create(
          :page_id => id,
          :order => 3,
          :title => "Food",
          :description => "Seasonal and simple. Our menu is designed with clean, tasty flavours in mind.")
      elsif self.order == 3
        contents << Content.create(
          :page_id => id,
          :order => 0,
          :title => "RESERVATIONS",
          :description => "Call  (020) 723-3170 from 9a – 11p daily, or book online.\nReservations required for parties of 4 or more.")
        contents << Content.create(
          :page_id => id,
          :order => 1,
          :title => "Make a Reservation",
          :description => "Find a table")
      end
    end

    self.attributes.merge({
      contents: contents.sort { |a,b| a.order <=> b.order }.map { |p| p.to_h },
      background: {
        large_url: background.large.url,
        small_url: background.small.url,
        url: background.url
      }
    }).except("site_id", "background")
  end
end
