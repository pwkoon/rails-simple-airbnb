class Flat < ApplicationRecord
  validates :name, :address, :description, :price_per_night, :number_of_guests, presence: true
  validates :price_per_night, inclusion: { in: 100..500, message: "should be between $100 to $500" }
  validates :number_of_guests, inclusion: { in: 1..10, message: "should be between 1 to $10" }
end
