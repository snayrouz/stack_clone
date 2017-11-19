require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:dummy) { User.create!(email: 'example@example.com', username: 'dummy', password: 'pass') }

end
