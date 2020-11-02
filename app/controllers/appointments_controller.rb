# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def index
    #@appointments = current_user.appointments #only current user appointment get with this query
    @appointments = Appointment.all
    if current_user.appointments.blank?
      flash[:alert] = "You hasn't any appointment"
    end
  end

  def new
    @appointment = Appointment.new
    @massage_therapist = MassageTherapist.find_by(id: params[:massage_therapist_id])
  end

  def show
    @appointment = Appointment.find_by_id(params[:id])
  end

  def user 
    @appointments = current_user.appointments
    if current_user.appointments.blank?
      flash[:alert] = "You do not have any scheduled appointments."
    end
  end 
  
  def create
    @appointment = Appointment.new(appointment_params)
    date_details
    @massage_therapist = MassageTherapist.find_by(id: params[:massage_therapist_id])
    @appointment.user_id = current_user.id
    if @appointment.save
      flash[:notice] = "Appointment successfully created"
      redirect_to appointment_path(@appointment)
    else
      flash[:alert] = "Appointment not created, please try again."
      render :new
    end
  end

  def edit
    @appointment = find_appointment
    @massage_therapist = MassageTherapist.find_by(id: params[:massage_therapist_id])

  end

  def update
    @appointment = find_appointment
    if !current_user.appointments.include?( @appointment)
      flash[:alert] = "You are not allowed to update someone else's appointment."
      redirect_to user_appointments_path
    else
      if @appointment.update(appointment_params)
        flash[:notice] = "Your appointment was successfully updated."
        redirect_to user_appointments_path
      else
        flash[:alert] = "Your appointment was not updated, please try again."
        render :edit
      end
    end
  end

  def destroy
    @appointment = find_appointment
    if !current_user.appointments.include?(@appointment)
      flash[:alert] = "You are not allowed to update someone else's appointment."
      redirect_to user_appointments_path
    else
      if @appointment.destroy
        flash[:notice] = "Your appointment was successfully deleted."
        redirect_to user_appointments_path
      else
        flash[:alert] = "Your appointment was not deleted, please try again."
        redirect_to user_appointments_path
      end
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
