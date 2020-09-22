require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :university}

  end

  describe "relationships" do
    it {should belong_to :hospital}
  end
end
