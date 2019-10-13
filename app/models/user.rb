class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  has_many :appointments
  has_many :landscapers, through: :appointments
  
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    self.first_name + " " + self.last_name
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name.split(" ")[0]
      user.last_name = auth.info.name.split(" ")[1]
    end
  end

end 
