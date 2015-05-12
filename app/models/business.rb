class Business < ActiveRecord::Base
  belongs_to :site
  has_many :hours

  def readonly?
    true
  end

  def to_h
    self.attributes.merge({ hours: Hour.to_day_h(hours) }).except("site_id")
  end

end
