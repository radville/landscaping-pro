class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => %i[facebook]

  has_many :appointments
  has_many :landscapers, through: :appointments
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  def self.from_omniauth(auth)
    binding.pry
    # Either create a User record or update it based on the provider (Google) and the UID   
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
    end
  end

  def full_name
    self.first_name + " " + self.last_name
  end
end 
