class AppointmentsController < ApplicationController

  def show
    @appointment = Appointment.find(params[:id])
    @appointment.appointment_datetime
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create(appointment_params)
    @appointment.doctor = Doctor.find_or_create_by(name: name)
    @appointment.patient = Patient.find_or_create_by(name: name)

    if @appointment.save
      redirect_to @appointment
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(
      :appointment_datetime,
      :doctor_name,
      :patient_name
    )
  end

end
