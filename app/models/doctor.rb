class Doctor < ApplicationRecord
  validates_presence_of :name, :specialty, :university

  belongs_to :hospital
end
