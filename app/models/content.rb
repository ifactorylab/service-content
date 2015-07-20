require 'carrierwave/orm/activerecord'

class Content < ActiveRecord::Base
  belongs_to :page
  mount_uploader :image, ImageUploader
  has_many :options

  def to_h
    self.attributes.merge({
      description: description.split("\n").reject{ |n| n == "" },
      image: {
        large_url: image.large.url,
        small_url: image.small.url,
        url: image.url
      },
      options: options.map { |option| option.to_h }.reduce({}, :merge)
    }).except("page_id", "description", "image")
  end
end
