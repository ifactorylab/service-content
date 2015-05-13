require 'carrierwave/orm/activerecord'
require './app/uploaders/background_uploader'

class Page < ActiveRecord::Base
  belongs_to :site
  has_many :contents
  mount_uploader :background, BackgroundUploader

  def to_h
    if contents.count == 0
      # If there's no page exist, we need to generate them
      contents << Content.create(
        :page_id => id,
        :order => 0,
        :title => site.name,
        :description => site.description,
        :image_url => "/layouts/1/spirit-outside.jpg")
      contents << Content.create(
        :page_id => id,
        :order => 1,
        :title => "Coffee",
        :description => "We use coffee from Cup in Woolloongabba. They roast a seasonal blend just for us and we also offer single origin espresso from them.",
        :image_url => "/layouts/1/espresso.jpg")
      contents << Content.create(
        :page_id => id,
        :order => 2,
        :title => "Baking",
        :description => "We bake every morning and will always have fresh cakes, pastries and muffins on hand.",
        :image_url => "/layouts/1/baking.jpg")
      contents << Content.create(
        :page_id => id,
        :order => 3,
        :title => "Food",
        :description => "Seasonal and simple. Our menu is designed with clean, tasty flavours in mind.",
        :image_url => "/layouts/1/eggs-hash.jpg")
    end

    self.attributes.merge({
      contents: contents.sort { |a,b| a.order <=> b.order }.map { |p| p.to_h },
      background: {
        large_url: background.large.url,
        url: background.url
      }
    }).except("site_id", "background")
  end
end
