# frozen_string_literal: true

class MassageTherapist < ActiveRecord::Base
    has_many :clients, through: :appointments
end
