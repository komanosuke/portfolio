# FactoryBot.define do
#   factory :post do
#     owner
#     sequence(:user_id) { |i| "#{i}" }
#     sequence(:content) { |i| "イベント名#{i}" }
#     sequence(:image_url) { |i| "http://example.com/image#{i}.jpg" }
#   end
# end


FactoryBot.define do
  factory :post do
    association :user, factory: :owner # userとの関連を定義する
    sequence(:user_id) { |i| "#{i}" }
    sequence(:content) { |i| "イベント名#{i}" }
    sequence(:image) { |i| "http://example.com/image#{i}. jpg" }
  end
end
