# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :appointments
  has_many :massage_therapists, through: :appointments
  validates_uniqueness_of :full_name, :email
  validates_presence_of :full_name, :email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:omniauthable, omniauth_providers: [:google_oauth2]
  
  def self.from_google(email:, full_name:)
    create_with(full_name: full_name).find_or_create_by!(email: email)
  end
end
