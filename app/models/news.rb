class News < ApplicationRecord
    belongs_to :news_cat
    mount_uploader :image, ImageUploader
end
