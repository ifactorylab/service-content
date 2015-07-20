class Option < ActiveRecord::Base
  belongs_to :content

  def to_h
    { key => value }
  end
end
