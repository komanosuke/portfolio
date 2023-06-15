class News < ApplicationRecord
    belongs_to :news_cat
    mount_uploader :image, ImageUploader
    validates :title, presence: true
    validates :image, presence: true
    validates :image_title, presence: true
    validates :text, presence: true

end
