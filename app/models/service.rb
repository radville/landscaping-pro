class Service < ApplicationRecord
    has_many :landscaper_services
    has_many :landscapers, through: :landscaper_services

    validates :description, presence: true

    def description=(description)
        super description.split(" ").map(&:capitalize).join(" ")
    end
end
