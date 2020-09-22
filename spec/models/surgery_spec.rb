require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :week_day}
    it {should validate_presence_of :operating_room}

  end

  describe "relationships" do
    it {should have_many :doctor_surgeries}
    it {should have_many(:doctors).through(:doctor_surgeries)}
  end

  describe "instance_methods"do
    it "#additional_surgeries_today" do
      @hospital = Hospital.create!(name: "Arique Clinical Care")

      @doctor_1 = @hospital.doctors.create!(name: "Wilmer", specialty: "Heart Surgery", university: "University of Minnesota" )
      @doctor_2 = @hospital.doctors.create!(name: "Hillary", specialty: "Stent Specialist", university: "Carleton College" )

      @surgery_1 = Surgery.create!(title: "Aortal Heart Surgery", week_day: "Monday", operating_room: "N204")
      @surgery_2 = Surgery.create!(title: "Open Heart Surgery", week_day: "Tuesday", operating_room: "W319")
      @surgery_3 = Surgery.create!(title: "Stent Heart Surgery", week_day: "Monday", operating_room: "N204")
      @surgery_4 = Surgery.create!(title: "Balloon Heart Surgery", week_day: "Monday", operating_room: "N204")


      DoctorSurgery.create!(doctor: @doctor_1, surgery: @surgery_1)
      DoctorSurgery.create!(doctor: @doctor_1, surgery: @surgery_2)
      DoctorSurgery.create!(doctor: @doctor_2, surgery: @surgery_2)
      DoctorSurgery.create!(doctor: @doctor_2, surgery: @surgery_3)
      DoctorSurgery.create!(doctor: @doctor_1, surgery: @surgery_4)
      DoctorSurgery.create!(doctor: @doctor_2, surgery: @surgery_4)

      expect(@surgery_1.additional_surgeries_today).to eq([@surgery_3.title, @surgery_4.title])
    end
  end
end
