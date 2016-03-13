require 'rails_helper'

feature 'Question 0' do
  xscenario do
    visit q0_questions_path

    rows = all('.answer tr')
    within rows[1] do
      col_texts = all('td').map(&:text).last(2)
      expect(col_texts).to eq %w(Alice Design)
    end
    within rows[2] do
      col_texts = all('td').map(&:text).last(2)
      expect(col_texts).to eq %w(Bob Design)
    end
    within rows[3] do
      col_texts = all('td').map(&:text).last(2)
      expect(col_texts).to eq %w(Chris Finance)
    end
    within rows[4] do
      col_texts = all('td').map(&:text).last(2)
      expect(col_texts).to eq ['Dave', '']
    end

    assert_sql_count
  end
end