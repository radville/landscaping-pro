class Landscaper < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments
  has_many :users, through: :appointments
  has_many :landscaper_services
  has_many :services, through: :landscaper_services

  validates :business_name, presence: true
  validates :owner_name, presence: true
  validates :zip_code, presence: true
end
