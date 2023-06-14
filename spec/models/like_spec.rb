require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }
  
  it "is valid with a user and post" do
    like = FactoryBot.build(:like, user: user, post: post)
    expect(like).to be_valid
  end
  
  it "is not valid without a user" do
    like = FactoryBot.build(:like, user: nil, post: post)
    expect(like).not_to be_valid
  end
  
  it "is not valid without a post" do
    like = FactoryBot.build(:like, user: user, post: nil)
    expect(like).not_to be_valid
  end
end
