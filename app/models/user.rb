class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :appointments
  has_many :landscapers, through: :appointments
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  def full_name
    self.first_name + " " + self.last_name
  end
end 
