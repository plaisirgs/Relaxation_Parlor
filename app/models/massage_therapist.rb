# frozen_string_literal: true

class MassageTherapist < ActiveRecord::Base
  has_many :appointments
  has_many :users, through: :appointments
  def self.specialty
    MassageTherapist.all.pluck "DISTINCT specialty"
  end
end
