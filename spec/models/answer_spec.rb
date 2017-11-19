require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:dummy) { User.create!(email: 'example@example.com', username: 'dummy', password: 'pass') }
  let(:question){ dummy.questions.create(title: "Hello!", text: "Hello, world.") }
  let(:answer){ dummy.answers.create(text: "My answer is right!") }

  it { should belong_to(:question) }
  it { should belong_to(:user) }
  it { should have_many(:votes) }
  it { should have_many(:comments) }

  it "should have text" do
    expect(answer.text).to eq("My answer is right!")
  end
end
