# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.find_by(id: current_user.id).appointments
  end

  def new
    @appointment = Appointment.new
    @massage_therapist = MassageTherapist.find_by(id: params[:massage_therapist_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    date_details
    @massage_therapist = MassageTherapist.find_by(id: params[:massage_therapist_id])
    if @appointment.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @appointment = find_appointment
  end

  def update
    @appointment = find_appointment
    @appointment.update(appointment_date: params[appointment_date])
    redirect_to user_appointments_path(current_user.id)
  end

  def destroy
    @appointment = find_appointment
    @appointment.destroy
    redirect_to user_appointments_path(current_user.id)
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
