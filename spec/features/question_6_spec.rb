require 'rails_helper'

feature 'Question 6' do
  xscenario do
    visit q6_questions_path

    rows = all('.answer tr')
    within rows[1] do
      expect(page).to have_content 'Alice'
    end
    within rows[2] do
      expect(page).to have_content 'Bob'
    end
    within rows[3] do
      expect(page).to have_content 'Chris'
    end

    within '.answer' do
      expect(page).to_not have_content 'Dave'
    end

    assert_sql_count
  end
end