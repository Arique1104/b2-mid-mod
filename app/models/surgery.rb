class Surgery < ApplicationRecord
  validates_presence_of :title, :week_day, :operating_room

  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def additional_surgeries_today
    Surgery.where(week_day: "#{self.week_day}").where.not(id: "#{self.id}").pluck(:title)
  end
end
