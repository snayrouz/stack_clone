require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:dummy) { User.create!(email: 'example@example.com', username: 'dummy', password: 'pass') }
  let(:comment){ dummy.comments.create(text: "My answer is right!", commentable_type: "Answer") }

  it { should belong_to(:user) }

  it "should have text" do
    expect(comment.text).to eq("My answer is right!")
  end

  it "should belong to a user" do
    expect(comment.user_id).to eq(dummy.id)
  end

  it "should have a commentable type" do
    expect(comment.commentable_type).to eq("Answer")
  end

end
