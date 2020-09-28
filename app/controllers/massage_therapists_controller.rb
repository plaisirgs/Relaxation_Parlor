# frozen_string_literal: true

class MassageTherapistsController < ApplicationController
  def index
    @massage_therapists = MassageTherapist.all
  end
end
