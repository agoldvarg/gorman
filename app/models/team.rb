class Team < ActiveRecord::Base
  has_many :games

  def long_name
    "#{self.city} #{self.name}"
  end
end
