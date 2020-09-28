# frozen_string_literal: true

class Client < ActiveRecord::Base
  belongs_to :massage_therapist
  has_many :appointments, through: :massage_therapists
  validates_presence_of :first_name, :last_name, :email_address, :password_digest
  validates_uniqueness_of :first_name, :last_name, :email_address, :password_digest
end
