require 'rails_helper'

RSpec.describe User, type: :model do
  

# アソシエーションのテスト

# バリデーションのテスト
# クラスメソッドのテスト
# スコープのテスト
# インスタンスメソッドのテスト
# コールバックのテスト
# カスタムバリデーションのテスト
# モデルメソッドのテスト
# データの作成と操作のテスト

  describe "remember" do
    let(:user) { FactoryBot.create(:user) }
  
    it "generates a new remember token" do
      user.remember
      expect(user.remember_token).not_to be_nil
    end
  
    it "hashes the remember token and saves it in the remember_digest" do
      user.remember
      expect(user.remember_digest).not_to be_nil
      expect(user.remember_digest).to eq(User.digest(user.remember_token))
    end
  end
  
  describe "remember(user)" do
    let(:user) { FactoryBot.create(:user) }
    
    it "calls remember method on the user object" do
      expect(user).to receive(:remember)
      remember(user)
    end
  
    it "saves the user id in an encrypted permanent cookie" do
      remember(user)
      expect(cookies.encrypted[:user_id]).to eq(user.id)
    end
  
    it "saves the remember token in a permanent cookie" do
      remember(user)
      expect(cookies.permanent[:remember_token]).to eq(user.remember_token)
    end
  end
  
  describe "authenticated?(attribute, token)" do
    let(:user) { FactoryBot.create(:user) }
    
    it "returns true if the token matches the digest" do
      user.remember
      expect(user.authenticated?(:remember, user.remember_token)).to eq(true)
    end
    
    it "returns false if the digest is nil" do
      expect(user.authenticated?(:remember, user.remember_token)).to eq(false)
    end
    
    it "returns false if the token does not match the digest" do
      user.remember
      expect(user.authenticated?(:remember, "invalid_token")).to eq(false)
    end
  end
  
  describe "forget" do
    let(:user) { FactoryBot.create(:user) }
    
    it "sets the remember_digest to nil" do
      user.remember
      user.forget
      expect(user.remember_digest).to be_nil
    end
  end
  
  describe "send_activation_email" do
    let(:user) { FactoryBot.create(:user) }
    
    it "sends an activation email" do
      expect(UserMailer).to receive(:account_activation).with(user).and_return(double(deliver_now: true))
      user.send_activation_email
    end
  
    it "updates the activation_sent_at attribute" do
      user.send_activation_email
      expect(user.activation_sent_at).not_to be_nil
    end
  end
  
  describe "activation_expired?" do
    let(:user) { FactoryBot.create(:user) }
    
    it "returns true if the activation link is expired" do
      user.update(activation_sent_at: 25.hours.ago)
      expect(user.activation_expired?).to eq(true)
    end
    
    it "returns false if the activation link is not expired" do
      user.update(activation_sent_at: 23.hours.ago)
      expect(user.activation_expired?).to eq(false)
    end
  end
  
  describe "activate" do
    let(:user) { FactoryBot.create(:user) }

    it "sets the activated attribute to true" do
      user.activate
      expect(user.activated).to eq(true)
    end
    
    it "updates the activated_at attribute" do
      user.activate
      expect(user.activated_at).not_to be_nil
    end
  end

  describe "create_reset_digest" do
    let(:user) { FactoryBot.create(:user) }
    
    it "generates a new reset token" do
      user.create_reset_digest
      expect(user.reset_token).not_to be_nil
    end
    
    it "hashes the reset token and saves it in the reset_digest" do
      user.create_reset_digest
      expect(user.reset_digest).not_to be_nil
      expect(user.reset_digest).to eq(User.digest(user.reset_token))
    end
    
    it "sets the reset_sent_at attribute to the current time" do
      user.create_reset_digest
      expect(user.reset_sent_at).to eq(Time.zone.now)
    end
  end
    
  describe "send_password_reset_email" do
    let(:user) { FactoryBot.create(:user) }
    
    it "sends a password reset email" do
      expect(UserMailer).to receive(:password_reset).with(user).and_return(double(deliver_now: true))
      user.send_password_reset_email
    end
  end
    
  describe "password_reset_expired?" do
    let(:user) { FactoryBot.create(:user) }
    
    it "returns true if the password reset link is expired" do
      user.update(reset_sent_at: 3.hours.ago)
      expect(user.password_reset_expired?).to eq(true)
    end
    
    it "returns false if the password reset link is not expired" do
      user.update(reset_sent_at: 1.hour.ago)
      expect(user.password_reset_expired?).to eq(false)
    end
  end
    
  describe "downcase_email" do
    let(:user) { FactoryBot.build(:user, email: "USER@EXAMPLE.COM") }
    
    it "converts the email to lowercase" do
      user.downcase_email
      expect(user.email).to eq("user@example.com")
    end
  end
    
  describe "create_activation_digest" do
    let(:user) { FactoryBot.build(:user) }
    
    it "generates a new activation token" do
      user.create_activation_digest
      expect(user.activation_token).not_to be_nil
    end
    
    it "hashes the activation token and saves it in the activation_digest" do
      user.create_activation_digest
      expect(user.activation_digest).not_to be_nil
      expect(user.activation_digest).to eq(User.digest(user.activation_token))
    end
  end

  describe "validations" do
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(8) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(255) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should validate_length_of(:username).is_at_most(50) }
  end
      
  describe "associations" do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:like_posts).through(:likes).source(:post) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:comment_posts).through(:comments).source(:post) }
    it { should have_many(:active_relationships).class_name("Relationship").with_foreign_key(:followed_id).dependent(:destroy) }
    it { should have_many(:followeds).through(:active_relationships).source(:follower) }
    it { should have_many(:passive_relationships).class_name("Relationship").with_foreign_key(:follower_id).dependent(:destroy) }
    it { should have_many(:followers).through(:passive_relationships).source(:followed) }
    it { should have_one(:cart).dependent(:destroy) }
    it { should have_one(:lifecost).dependent(:destroy) }
    it { should have_many(:study_records) }
  end
      
  describe "methods" do
    let(:user) { FactoryBot.create(:user) }
    
    
    
    it "returns true if the user is followed by another user" do
      another_user = FactoryBot.create(:user)
      FactoryBot.create(:relationship, follower_id: another_user.id, followed_id: user.id)
      expect(user.followed_by?(another_user)).to eq(true)
    end
    
    it "returns false if the user is not followed by another user" do
      another_user = FactoryBot.create(:user)
      expect(user.followed_by?(another_user)).to eq(false)
    end
  end
end






# has_secure_password
# validates :password, presence: true, #空白を許可しない
#                     length: {minimum: 8}, #最低8文字必要とする
#                     on: :create
# validates :email, presence: true,
#                     length: { maximum: 255 },
#                     uniqueness: true
# attr_accessor  :remember_token, :activation_token, :reset_token
# before_save   :downcase_email
# before_create :create_activation_digest

# # sns
# has_many :posts, dependent: :destroy
# has_many :likes, dependent: :destroy
# has_many :like_posts, through: :likes, source: :post
# has_many :comments, dependent: :destroy
# has_many :comment_posts, through: :comments, source: :post

# has_many :active_relationships, class_name: "Relationship",
#                                 foreign_key: :followed_id,
#                                 dependent: :destroy
# has_many :followeds, through: :active_relationships, source: :follower
# has_many :passive_relationships, class_name: "Relationship",
#                                 foreign_key: :follower_id,
#                                 dependent: :destroy
# has_many :followers, through: :passive_relationships, source: :followed

# def followed_by?(user)
#     active_relationships.find_by(follower_id: user.id).present?
# end

# validates :name, presence: true, length: { maximum: 50 }
# validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }

# # EC
# has_one :cart, dependent: :destroy
# # has_many :orders, dependent: :destroy
# has_one :lifecost, dependent: :destroy

# has_many :study_records

# mount_uploader :image, ImageUploader



# # ランダムな記憶トークンを返す
# def User.new_token
#   SecureRandom.urlsafe_base64
# end
# # 渡された文字列のハッシュ値を返す
# def User.digest(string)
#   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
#   BCrypt::Password.create(string, cost: cost)
# end
# # 上記２つのメソッドを利用し、生成された記憶トークンをハッシュ化
# # ハッシュ化した記憶トークンをDB（remember_digest）に保存する
# def remember
#   self.remember_token = User.new_token
#   update_attribute(:remember_digest, User.digest(remember_token))
# end
# # ユーザーのセッションをcookieに保存する（永続的セッション）
# def remember(user)
#   user.remember
#   cookies.permanent.encrypted[:user_id] = user.id
#   cookies.permanent[:remember_token] = user.remember_token
# end
#   # # cookiesに保存されたセッションに有効期限を設けたい場合（１ヶ月）
#   # def remember(user)
#   #     user.remember
#   #     # cookies の有効期限を 1ヶ月 にしたい場合
#   #     cookies.encrypted[:user_id] = { value: user.id, expires: 1.month.from_now }
#   #     cookies[:remember_token] = { value: user.remember_token, expires: 1.month.from_now }
#   # end
# # cookiesから渡されたトークンがダイジェスト(ハッシュ化されたトークン）と一致したらtrueを返す
# # 渡されたトークンがダイジェストと一致したらtrueを返す
# def authenticated?(attribute, token)
#   digest = send("#{attribute}_digest")
#   return false if digest.nil?
#   BCrypt::Password.new(digest).is_password?(token)
# end
# # ユーザーの記憶ダイジェストを破棄する
# def forget
#   update_attribute(:remember_digest, nil)
# end

# # 有効化用のメールを送信する
# def send_activation_email
#   UserMailer.account_activation(self).deliver_now
#   update_attribute(:activation_sent_at, Time.zone.now)
# end
# # 有効化リンクの有効期限（24時間）が切れている場合はtrueを返す
# def activation_expired?
#   activation_sent_at < 24.hours.ago
# end
# # アカウントを有効にする
# def activate
#   update_attribute(:activated, true)
#   update_attribute(:activated_at, Time.zone.now)
# end

# # パスワード再設定の属性を設定する
# def create_reset_digest
#   self.reset_token = User.new_token
#   update_attribute(:reset_digest, User.digest(reset_token))
#   update_attribute(:reset_sent_at, Time.zone.now)
# end

# # パスワード再設定のメールを送信する
# def send_password_reset_email
#   UserMailer.password_reset(self).deliver_now
# end

# # パスワード再設定の有効期限が切れている場合はtrueを返す
# def password_reset_expired?
#   reset_sent_at < 2.hours.ago
# end

# private
# # メールアドレスをすべて小文字にする
# def downcase_email
#   self.email = email.downcase
# end
# # 有効化トークンとダイジェストを作成及び代入する
# def create_activation_digest
#   self.activation_token = User.new_token
#   self.activation_digest = User.digest(activation_token)
# end