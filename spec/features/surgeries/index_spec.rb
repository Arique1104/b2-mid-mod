require "rails_helper"

RSpec.describe "When I visit a surgery’s index page (‘/surgeries’)" do
  it "I see the title of all surgeries. And for each surgery I see the names of all doctors performing that surgery" do


    @hospital = Hospital.create!(name: "Arique Clinical Care")

    @doctor_1 = @hospital.doctors.create!(name: "Wilmer", specialty: "Heart Surgery", university: "University of Minnesota" )

    @doctor_2 = @hospital.doctors.create!(name: "Hillary", specialty: "Stent Specialist", university: "Carleton College" )


    @surgery_1 = Surgery.create!(title: "Aortal Heart Surgery", week_day: "Monday", operating_room: "N204")

    @surgery_2 = Surgery.create!(title: "Open Heart Surgery", week_day: "Tuesday", operating_room: "W319")


    DoctorSurgery.create!(doctor: @doctor_1, surgery: @surgery_1)

    DoctorSurgery.create!(doctor: @doctor_1, surgery: @surgery_2)

    DoctorSurgery.create!(doctor: @doctor_2, surgery: @surgery_2)


    visit "/surgeries"

    expect(page).to have_content(@surgery_1.title)
      expect(page).to have_content(@doctor_1.name)

    expect(page).to have_content(@surgery_2.title)
      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_2.name)

  end
end
