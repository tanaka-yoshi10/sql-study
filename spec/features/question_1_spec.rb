require 'rails_helper'

feature 'Question 1' do
  scenario do
    visit q1_questions_path

    rows = all('.answer tr')
    within rows[1] do
      expect(page).to have_content 'Chris'
    end
    within rows[2] do
      expect(page).to have_content 'Dave'
    end

    within '.answer' do
      expect(page).to_not have_content 'Alice'
      expect(page).to_not have_content 'Bob'
    end

    assert_sql_count
  end
end