class Lifecost < ApplicationRecord
    belongs_to :user, dependent: :destroy

    validates :twenty, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000 }
    validates :thirty, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000 }
    validates :forty, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000 }
    validates :fifty, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000 }
    validates :sixty, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000 }
    validates :marriage, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
    validates :child, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
    validates :house, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
    validates :car, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
    validates :care, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
    validates :rent, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :utility, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :internet, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :insurance, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :car_cost, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :child_care, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :lesson, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :transport, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :pocket_money, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :other_cost, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :food, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :necessity, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :medical_cost, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :child_lesson, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :clothes, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :beauty, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :companionship, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :entertainment, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :small_cost, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :exception, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
    validates :marriage_total, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000000 }
    validates :child_total, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000 }
    validates :house_total, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000 }
    validates :car_total, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000 }
    validates :insurance_total, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000 }
    validates :retire_total, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000 }
    validates :tax, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :pension, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000 }
end
