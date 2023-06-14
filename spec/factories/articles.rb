FactoryBot.define do
    factory :article do
        association :article_cat
        title { "Sample Article" }
        image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'noimage.jpg'), 'image/jpeg') }
        image_title { "Article Image" }
        text { "This is a sample article." }
    end
end

# 上記のコードとバリデーションに対して、models/xxx_spec.rbの記述はどう書けばいいですか？