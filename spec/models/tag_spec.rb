require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { Tag.create!(name: 'ruby') }

  it { should have_many(:taggings) }
  it { should have_many(:questions) }

  it "should have a name" do
    expect(tag.name).to eq("ruby")
  end
end
