class Landscaper < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments
  has_many :users, through: :appointments
  has_many :landscaper_tasks
  has_many :tasks, through: :landscaper_tasks
end
