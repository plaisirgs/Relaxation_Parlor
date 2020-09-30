# frozen_string_literal: true

class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :massage_therapist
end

