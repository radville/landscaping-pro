class Appointment < ApplicationRecord
    belongs_to :landscaper
    belongs_to :user
end
