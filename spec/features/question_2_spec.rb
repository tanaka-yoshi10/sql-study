require 'rails_helper'

feature 'Question 2' do
  scenario do
    visit q2_questions_path

    rows = all('.answer tr')
    within rows[1] do
      expect(page).to have_content 'Ruby'
      expect(page).to have_content '2件'
    end
    within rows[2] do
      expect(page).to have_content 'Java'
      expect(page).to have_content '1件'
    end
    within rows[3] do
      expect(page).to have_content 'COBOL'
      expect(page).to have_content '0件'
    end
    assert_sql_count
  end
end