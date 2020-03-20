class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(patient_params)
    redirect_to patients_path
  end

  def show
    @patient = Patient.find(params[:id])
  end

  private

  def patients_params
    params.require(:patient).permit(:name, :age)
  end

  def doctors_params
    params.require(:doctor).permit(:name)
  end

end
