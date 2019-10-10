class Service < ApplicationRecord
    has_many :landscaper_services
    has_many :landscapers, through: :landscaper_services
end
