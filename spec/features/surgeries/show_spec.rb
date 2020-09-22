require "rails_helper"

RSpec.describe "" do

  it "When I visit the surgery index page. I can click on any surgery title to take me to that surgery’s show page. And on the show page I see the title and operating room number of that surgery" do
    @hospital = Hospital.create!(name: "Arique Clinical Care")

    @doctor_1 = @hospital.doctors.create!(name: "Wilmer", specialty: "Heart Surgery", university: "University of Minnesota" )
    @doctor_2 = @hospital.doctors.create!(name: "Hillary", specialty: "Stent Specialist", university: "Carleton College" )

    @surgery_1 = Surgery.create!(title: "Aortal Heart Surgery", week_day: "Monday", operating_room: "N204")
    @surgery_2 = Surgery.create!(title: "Open Heart Surgery", week_day: "Tuesday", operating_room: "W319")

    DoctorSurgery.create!(doctor: @doctor_1, surgery: @surgery_1)
    DoctorSurgery.create!(doctor: @doctor_1, surgery: @surgery_2)
    DoctorSurgery.create!(doctor: @doctor_2, surgery: @surgery_2)

    visit "/surgeries"

    click_on "#{@surgery_1.title}"

    expect(current_path).to eq("/surgeries/#{@surgery_1.id}")

    expect(page).to have_content(@surgery_1.title)
    expect(page).to have_content(@surgery_1.operating_room)

  end


  it "And I see a section of the page that says Other surgeries happening this day of the week: And under that header I see titles of all surgeries that happen on the same day of the week as this surgery." do
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


    visit "/surgeries"

    click_on "#{@surgery_1.title}"

    expect(current_path).to eq("/surgeries/#{@surgery_1.id}")

    expect(page).to have_content(@surgery_1.title)
    expect(page).to have_content(@surgery_1.operating_room)


    within "#surgery-#{@surgery_1.id}" do
      expect(page).to have_content("Other surgeries happening this day of the week:")
      expect(page).not_to have_content(@surgery_2.title)
      expect(page).to have_content(@surgery_3.title)
      expect(page).to have_content(@surgery_4.title)
    end
  end
end
