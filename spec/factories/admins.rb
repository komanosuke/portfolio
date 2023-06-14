FactoryBot.define do
  factory :admin do
    name { "admin_user" }
    password_digest { BCrypt::Password.create("password") }
  end
end