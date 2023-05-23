class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    validates :content, presence: true, length: { maximum: 280 }
    default_scope -> { order(created_at: :desc) }

    mount_uploader :image, ImageUploader

    def liked_by?(user)
        likes.where(user_id: user.id).exists?
    end

    def commented_by?(user)
        comments.where(user_id: user.id).exists?
    end
end