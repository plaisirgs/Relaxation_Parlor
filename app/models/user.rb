# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password
  has_many :appointments
  has_many :massage_therapists, through: :appointments
  validates_presence_of :first_name, :last_name, :email_address, :password_digest
  validates_uniqueness_of :first_name, :last_name, :email_address, :password_digest
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
