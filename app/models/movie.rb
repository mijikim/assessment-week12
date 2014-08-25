class Movie < ActiveRecord::Base

  validates :name, presence: true
  validates :year, presence: true, length: { is: 4 }, numericality: { only_integer: true }
  validates :synopsis, presence: true

end