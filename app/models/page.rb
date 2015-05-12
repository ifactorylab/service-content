class Page < ActiveRecord::Base
  belongs_to :site
  has_many :contents

  def to_h
    self.attributes.merge({ contents: contents.sort { |a,b| a.order <=> b.order } })
  end
end
