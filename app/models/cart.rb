class Cart < ApplicationRecord
    belongs_to :user, optional: true
    has_many :cart_works, dependent: :destroy
    has_many :works, through: :cart_works

    validates :quantity, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
