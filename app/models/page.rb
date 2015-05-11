class Page < ActiveRecord::Base
  belongs_to :site
  has_many :contents
end
