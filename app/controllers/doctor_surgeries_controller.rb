class DoctorSurgeriesController < ApplicationController

  def create
    surgery = Surgery.find(params[:id])
    doctor = Doctor.find_by(name: params[:doctor_name])
    DoctorSurgery.create!(doctor: doctor, surgery: surgery)
    redirect_to "/surgeries/#{surgery.id}"
  end

end
