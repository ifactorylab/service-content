class Option < ActiveRecord::Base
  belongs_to :content

  def to_h
    self.attributes.except("content_id", "id", "created_at", "updated_at")
  end
end
