class Article < ApplicationRecord
    belongs_to :article_cat
    mount_uploader :image, ImageUploader
end
