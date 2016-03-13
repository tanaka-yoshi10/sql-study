require 'rails_helper'

feature 'Question 2' do
  xscenario do
    visit q2_questions_path

    rows = all('.answer tr')
    within rows[1] do
      expect(page).to have_content 'Ruby'
      expect(page).to have_content '2'
    end
    within rows[2] do
      expect(page).to have_content 'Java'
      expect(page).to have_content '1'
    end
    within rows[3] do
      expect(page).to have_content 'COBOL'
      expect(page).to have_content '0'
    end
    assert_sql_count
  end
end