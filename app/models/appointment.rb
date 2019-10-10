class Appointment < ApplicationRecord
    belongs_to :landscaper
    belongs_to :user

    validates :datetime, presence: true
    validates :landscaper_id, presence: true
    validates :user_id, presence: true
    validates :price, presence: true
end
