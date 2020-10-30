# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def index
    #@appointments = current_user.appointments #only current user appointment get with this qurey
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
    @massage_therapist = MassageTherapist.find_by(id: params[:massage_therapist_id])
  end

  def show
    @appointments = Appointment.where(user_id: params[:id])
  end
  
  def create
    @appointment = Appointment.new(appointment_params)
    date_details
    @massage_therapist = MassageTherapist.find_by(id: params[:massage_therapist_id])
    @appointment.user_id = current_user.id
    if @appointment.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @appointment = find_appointment
  end

  def update
    @appointment = find_appointment
    if !current_user.appointments.include?(appointment)
      redirect_to appointments_path
    else
      @appointment.update(appointment_date: params[appointment_date])
      redirect_to appointment_path(current_user.id)
    end
  end

  def destroy
    @appointment = find_appointment
    if !current_user.appointments.include?(appointment)
      redirect_to appointments_path
    else
      @appointment.destroy
      redirect_to appointment_path(current_user.id)
    end
  end

  def date_details
    DateTime.new(appointment_params['appointment_date(1i)'].to_i, appointment_params['appointment_date(2i)'].to_i, appointment_params['appointment_date(3i)'].to_i, appointment_params['appointment_date(4i)'].to_i, appointment_params['appointment_date(5i)'].to_i)
end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :massage_therapist_id, :user_id)
  end

  def find_appointment
    appointment = Appointment.find_by(id: params[:id])
   
    appointment
  end
end
