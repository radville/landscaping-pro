class Task < ApplicationRecord
    has_many :tasks_landscapers
    has_many :tasks, through: :tasks_landscapers
end
