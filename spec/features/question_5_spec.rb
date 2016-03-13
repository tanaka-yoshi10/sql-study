require 'rails_helper'

feature 'Question 5' do
  xscenario do
    visit q5_questions_path

    rows = all('.answer tr')
    within rows[1] do
      col_texts = all('td').map(&:text)
      expect(col_texts).to eq %w(Ruby入門 2 1 1 2)
    end
    within rows[2] do
      col_texts = all('td').map(&:text)
      expect(col_texts).to eq %w(応用COBOL 0 1 0 0)
    end
    within rows[3] do
      col_texts = all('td').map(&:text)
      expect(col_texts).to eq %w(はじめてのAda 0 0 0 0)
    end
    assert_sql_count
  end
end