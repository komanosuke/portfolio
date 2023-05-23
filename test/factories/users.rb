# FactoryBot.define do
#   factory :user, aliases: [:owner] do
#     provider { "github" }
#     sequence(:uid) { |i| "uid#{i}" }
#     sequence(:name) { |i| "name#{i}" }
#     sequence(:image_url) { |i| "http://example.com/image#{i}. jpg" }
#   end
# end

FactoryBot.define do
  factory :user do
    sequence(:id) { |i| "id#{i}" }
    sequence(:name) { |i| "name#{i}" }
    sequence(:username) { |i| "username#{i}" }
    sequence(:email) { |i| "email#{i}" }
    sequence(:password) { |i| "password#{i}" }
    sequence(:image) { |i| "http://example.com/image#{i}. jpg" }

    factory :owner, aliases: [:post_owner] # postオブジェクトのuserとの関連を定義するためのエイリアス
  end
end
