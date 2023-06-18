class StudyRecord < ApplicationRecord
    belongs_to :user, dependent: :destroy
    validates :grade1, presence: true
    validates :grade2, presence: true
    validates :grade3, presence: true
    validates :grade4, presence: true
    validates :grade5, presence: true
    validates :grade6, presence: true
end
