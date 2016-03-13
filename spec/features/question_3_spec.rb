require 'rails_helper'

feature 'Question 3' do
  xscenario do
    visit q3_questions_path

    rows = all('.answer tr')
    within rows[1] do
      expect(page).to have_content '山登り'
      expect(page).to have_content '予算を決める'
      expect(page).to have_content '2026-02-01'
    end
    within rows[2] do
      expect(page).to have_content '新人歓迎会'
      expect(page).to have_content '参加者を募る'
      expect(page).to have_content '2026-03-01'
    end
    within rows[3] do
      expect(page).to have_content 'Elixir勉強会'
    end
    assert_sql_count
  end
end