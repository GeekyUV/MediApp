class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role, except: [:index, :show]

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user = current_user

    if @patient.save
      flash[:notice] = 'Patient was successfully created.'
      redirect_to patients_path
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to patients_path, notice: 'Patient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :email, :phone, :diagnosis)
  end

  def check_role
    unless current_user.doctor? || current_user.receptionist?
      redirect_to root_path, alert: "Access denied."
    end
  end

end
