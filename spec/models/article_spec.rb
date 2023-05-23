# spec/models/article_spec.rb

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      article = build(:article)
      expect(article).to be_valid
    end

    it 'is invalid without a title' do
      article = build(:article, title: nil)
      article.valid?
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without a text' do
      article = build(:article, text: nil)
      article.valid?
      expect(article.errors[:text]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it { should belong_to(:article_cat) }
  end
end