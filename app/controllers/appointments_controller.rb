# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy]

  def date_details
    DateTime.new(appointment_params['appointment_date(1i)'].to_i, appointment_params['appointment_date(2i)'].to_i, appointment_params['appointment_date(3i)'].to_i, appointment_params['appointment_date(4i)'].to_i, appointment_params['appointment_date(5i)'].to_i)
  end


  def index
    if params[:massage_therapist_id]
      massage_therapist = MassageTherapist.find(params[:massage_therapist_id])
      @appointments = massage_therapist.appointments
    else
      @appointments = Appointment.all
   end
  end

def check_availability
  @check_availability = @massage_therapist.appointments.find_by(appointment_date: @date)
    unless @check_availability.nil?
      flash[:alert] = 'This appointment date and time is not available.'
      redirect_to new_massage_therapist_appointment_path(@massage_therapist) and return
    end
  end

  def unavailable_appointment
      if appointment_params['appointment_date(4i)'].to_i > 17 || appointment_params['appointment_date(4i)'].to_i < 9
      flash[:alert] = 'The time you selected is out of the business hours.'
      redirect_to new_massage_therapist_appointment_path(@massage_therapist) and return
    end
  end

  def create
    @massage_therapist = MassageTherapist.find(params[:massage_therapist_id])
    date_details
    check_availability
    unavailable_appointment

    appointment_params[:appointment_date] = @date
    @appointment = @massage_therapist.appointments.new(appointment_params)
    @appointment.user = current_user

    if @appointment.save

      redirect_to massage_therapist_appointment_path(@massage_therapist, @appointment) and return
    else
      render :new
    end
  end

  def new
    @appointment = Appointment.new(massage_therapist_id: params[:massage_therapist_id])
    @massage_therapist = MassageTherapist.find(params[:massage_therapist_id])
  end

  def edit
    @massage_therapist = MassageTherapist.find(params[:massage_therapist_id])
  end
 

  def show; end

  def update
    @massage_therapist = @appointment.massage_therapist
    set_appointment
    if @appointment.update(appointment_params)
     date_details
      redirect_to [@massage_therapist, @appointment]
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    flash[:notice] = 'You have successfully deleted this appointment.'
    redirect_to root_path
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :massage_therapist_id)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
