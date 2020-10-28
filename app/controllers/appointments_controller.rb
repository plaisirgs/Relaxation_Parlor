# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy]

  def index
    if params[:massage_therapist_id]
      massage_therapist = MassageTherapist.find(params[:massage_therapist_id])
      @appointments = massage_therapist.appointments
    else
      @appointments = Appointment.all
   end
  end

  def create
    if params[:appointment][:massage_therapist_id]
      @massage_therapist = MassageTherapist.find(params[:appointment][:massage_therapist_id])
      @date = DateTime.new(params[:years].to_i, params[:months].to_i, params[:days].to_i, params[:hours].to_i, params[:minutes].to_i, params[:minutes].to_i)

      @check_availability = @massage_therapist.appointments.find_by(appointment_date: @date)
      unless @check_availability.nil?
        flash[:alert] = 'This appointment date and time is not available.'
        redirect_to new_appointment_path and return
      end
      # if params[:hours].to_i > 17 || params[:hours].to_i < 9
      #   flash[:alert] = "The time you selected is out of the business hours."
      #   redirect_to new_appointment_path and return
      # end
      @my_params = appointment_params
      @my_params[:appointment_date] = @date
      @appointment = Appointment.new(@my_params)
      @appointment.appointment_date = @date

    else

      @appointment = Appointment.new(appointment_params)
    end
    if @appointment.save

      redirect_to @appointment and return
    else
      render :new
    end
  end

  def new
    @appointment = Appointment.new(massage_therapist_id: params[:massage_therapist_id])
    @massage_therapist_id = params[:massage_therapist_id]
  end

  def edit; end

  def show; end

  def update
    if @appointment.update(appointment_params)
      @date = DateTime.new(params[:years].to_i, params[:months].to_i, params[:days].to_i, params[:hours].to_i, params[:minutes].to_i)
      @appointment.update(appointment_date: @date)
      redirect_to @appointment
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
    params.require(:appointment).permit(:appointment_date, :user_id, :massage_therapist_id)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
