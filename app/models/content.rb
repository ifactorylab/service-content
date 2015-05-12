class Content < ActiveRecord::Base
  belongs_to :page

  def to_h
    self.attributes.merge({ description: description.split("\n").reject{ |n| n == "" } })
      .except("page_id", "description")
  end
end
