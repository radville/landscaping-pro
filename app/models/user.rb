class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :appointments
  has_many :landscapers, through: :appointments

  def full_name
    self.first_name + " " + self.last_name
  end
end
