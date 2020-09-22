class Surgery < ApplicationRecord
  validates_presence_of :title, :week_day, :operating_room

  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries
end
