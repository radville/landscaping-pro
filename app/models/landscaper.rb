class Landscaper < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments
  has_many :users, through: :appointments
  has_many :tasks_landscapers
  has_many :tasks, through: :tasks_landscapers
end
