class User < ApplicationRecord
    has_secure_password
    validates :password, presence: true, #空白を許可しない
                        length: {minimum: 8}, #最低8文字必要とする
                        on: :create
    validates :email, presence: true,
                        length: { maximum: 255 },
                        uniqueness: true
    validates :username, presence: true
    validates :zip, presence: true
    validates :prefecture, presence: true
    validates :city, presence: true
    validates :street, presence: true
    validates :tel, presence: true
    attr_accessor  :remember_token, :activation_token, :reset_token
    before_save   :downcase_email
    before_create :create_activation_digest

    # sns
    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :like_posts, through: :likes, source: :post
    has_many :comments, dependent: :destroy
    has_many :comment_posts, through: :comments, source: :post

    has_many :active_relationships, class_name: "Relationship",
                                    foreign_key: :followed_id,
                                    dependent: :destroy
    has_many :followeds, through: :active_relationships, source: :follower
    has_many :passive_relationships, class_name: "Relationship",
                                    foreign_key: :follower_id,
                                    dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :followed

    def followed_by?(user)
        active_relationships.find_by(follower_id: user.id).present?
    end

    validates :name, presence: true, length: { maximum: 50 }
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }

    # EC
    has_one :cart, dependent: :destroy
    # has_many :orders, dependent: :destroy
    has_one :lifecost, dependent: :destroy

    has_one :study_record, dependent: :destroy

    mount_uploader :image, ImageUploader
    mount_uploader :photo, ImageUploader
    mount_uploader :audio, AudioUploader
    mount_uploader :video, VideoUploader

    # ランダムな記憶トークンを返す
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    # 渡された文字列のハッシュ値を返す
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    # 上記２つのメソッドを利用し、生成された記憶トークンをハッシュ化
    # ハッシュ化した記憶トークンをDB（remember_digest）に保存する
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    # ユーザーのセッションをcookieに保存する（永続的セッション）
    def remember(user)
        user.remember
        cookies.permanent.encrypted[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end
        # # cookiesに保存されたセッションに有効期限を設けたい場合（１ヶ月）
        # def remember(user)
        #     user.remember
        #     # cookies の有効期限を 1ヶ月 にしたい場合
        #     cookies.encrypted[:user_id] = { value: user.id, expires: 1.month.from_now }
        #     cookies[:remember_token] = { value: user.remember_token, expires: 1.month.from_now }
        # end
    # cookiesから渡されたトークンがダイジェスト(ハッシュ化されたトークン）と一致したらtrueを返す
    # 渡されたトークンがダイジェストと一致したらtrueを返す
    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end
    # ユーザーの記憶ダイジェストを破棄する
    def forget
        update_attribute(:remember_digest, nil)
    end

    # 有効化用のメールを送信する
    def send_activation_email
        UserMailer.account_activation(self).deliver_now
        update_attribute(:activation_sent_at, Time.zone.now)
    end
    # 有効化リンクの有効期限（24時間）が切れている場合はtrueを返す
    def activation_expired?
        activation_sent_at < 24.hours.ago
    end
    # アカウントを有効にする
    def activate
        update_attribute(:activated, true)
        update_attribute(:activated_at, Time.zone.now)
    end

    # パスワード再設定の属性を設定する
    def create_reset_digest
        self.reset_token = User.new_token
        update_attribute(:reset_digest, User.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end

    # パスワード再設定のメールを送信する
    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end

    # パスワード再設定の有効期限が切れている場合はtrueを返す
    def password_reset_expired?
        reset_sent_at < 2.hours.ago
    end

    private
    # メールアドレスをすべて小文字にする
    def downcase_email
        self.email = email.downcase
    end
    # 有効化トークンとダイジェストを作成及び代入する
    def create_activation_digest
        self.activation_token = User.new_token
        self.activation_digest = User.digest(activation_token)
    end
end