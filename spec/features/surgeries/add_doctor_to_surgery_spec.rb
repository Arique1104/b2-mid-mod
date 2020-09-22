require "rails_helper"

RSpec.describe "Adding a doctor to a surgery" do
  it "When I visit a surgery's show page. I see a field with instructions to Add A Doctor To This Surgery. When I input the name of a Doctor into that field. And I click submit. I'm taken back to that surgery's show page. And I see the name of that doctor listed on the page" do
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


    visit "/surgeries/#{@surgery_1.id}"

    expect(page).to have_content("#{@doctor_1.name}")
    expect(page).not_to have_content("#{@doctor_2.name}")


    within "#add_doctor-#{@surgery_1.id}" do
      expect(page).to have_content("Add A Doctor To This Surgery")
      fill_in :doctor_name, with: "#{@doctor_2.name}"
      click_on "Add Doctor"
    end

    expect(current_path).to eq("/surgeries/#{@surgery_1.id}")

    expect(page).to have_content("#{@doctor_1.name}")
    expect(page).to have_content("#{@doctor_2.name}")
  end
end
