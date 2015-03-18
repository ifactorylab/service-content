class Hour < ActiveRecord::Base
  belongs_to :business

  def readonly?
    true
  end

  def self.to_day_h(hours)
    hash = {}
    hours.each do |hour|
      if hash[hour.day]
        hash[hour.day] << hour
      else
        hash[hour.day] = [ hour ]
      end
    end
    hash
  end
end
