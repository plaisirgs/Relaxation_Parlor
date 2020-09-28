# frozen_string_literal: true

class Appointment < ActiveRecord::Base
  belongs_to :client
  belongs_to :massage_therapist
end

# appointment date
# appointment time
# price of massage
# length of massage
# selected massage therapist
