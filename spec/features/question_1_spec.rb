require 'rails_helper'

feature 'Question 1' do
  scenario do
    visit q1_questions_path
    within '.answer' do
      expect(page).to have_content 'Chris'
      expect(page).to have_content 'Dave'
      expect(page).to_not have_content 'Alice'
      expect(page).to_not have_content 'Bob'
    end
  end
end