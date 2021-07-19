class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.order_by_age
    order(:age)
  end

  def self.average_age
    average(:age).round(0).to_int
  end

  def self.search(name)
    result = where(name: name)
    result[0]
  end

  def coworkers
  end 
end
