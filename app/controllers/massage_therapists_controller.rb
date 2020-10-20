# frozen_string_literal: true

class MassageTherapistsController < ApplicationController
  def index
     @massage_therapists = MassageTherapist.all
        @therapists = MassageTherapist.where(specialty: params[:specialty])
  end


  def show
    @therapist = MassageTherapist.find(params[:id])
  end

  def massage_params
    params.require(:massage_therapist).permit(:specialty)
  end
end
