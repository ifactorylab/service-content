class Style < ActiveRecord::Base
  belongs_to :site
  mount_uploader :logo, LogoUploader

  def readonly?
    true
  end

  def to_h
    self.attributes.merge({
      logo: {
        small_url: logo.small.url,
        thumb_url: logo.thumb.url,
        url: logo.url
      }
    }).except("site_id")
  end
end
