# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def index
    if params[:massage_therapist_id]
    massage_therapist = MassageTherapist.find(params[:massage_therapist_id])
    @appointments = massage_therapist.appointments
    else 
    @appointments = Appointment.all
   end
  end

   def create
    if params[:massage_therapist_id]
       massage_therapist = MassageTherapist.find(params[:massage_therapist_id])
       @appointment = massage_therapist.appointments.build[params:appointment]
    else
       @appointment = Appointment.new(params[:appointment])
    end
    if @appointment.save
      redirect_to @appointment
    else 
      render :new
    end
   end

   def new
    @appointment = Appointment.new(params[:appointment])
   end

   def edit 
    @appointment = Appointment.find(params[:appointment])
   end

   def show
    @appointment = Appointment.find(params[:appointment])
   end

   def update
    @appointment = Appointment.find(params[:appointment])
    if @appointment.update(appointment_params)
      redirect_to @appointment
    else
      render :edit
    end
   end

   def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
   end
end

