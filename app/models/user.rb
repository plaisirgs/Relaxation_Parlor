# frozen_string_literal: true

class User < ActiveRecord::Base
  @@local_auth = true

  has_many :appointments
  has_many :massage_therapists, through: :appointments
  validates_uniqueness_of :full_name, :email
  validates_presence_of :full_name, :email
  validates_presence_of :password, if: :requires_password?
  validates_confirmation_of :password, if: :requires_password?
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:)
    @@local_auth = false
    create_with(full_name: full_name).find_or_create_by!(email: email)
  end

  def requires_password?
    @@local_auth
  end
end
