class Task < ApplicationRecord
    has_many :landscaper_tasks
    has_many :landscapers, through: :landscaper_tasks
end
