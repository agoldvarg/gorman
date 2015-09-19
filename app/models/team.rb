class Team < ActiveRecord::Base
  attr_reader :name, :city

  has_many :games

end
