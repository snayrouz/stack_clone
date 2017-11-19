require 'rails_helper'

RSpec.feature "User searches for questions by tags" do
  scenario "they see number of total questions and details" do
    VCR.use_cassette("features/user_sees_question_details") do
      visit '/tags'
      fill_in "q", with: "ruby"
      click_on "Search"

      expect(current_path).to eq("/search")
      expect(page).to have_content("Number Total Questions")

      within(".question-1") do
        expect(page).to have_css(".title")
        expect(page).to have_css(".text")
        expect(page).to have_css(".user_id")
        expect(page).to have_css(".correct_answer")
        expect(page).to have_css(".created_at")
      end

      expect(page).to have_css(".question", count: 1)
    end
  end
end
