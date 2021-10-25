class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.order_by_rating_descending
    order(thrill_rating: :desc)
  end
end
