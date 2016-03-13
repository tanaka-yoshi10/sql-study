require 'rails_helper'

feature 'Question 7' do
  xscenario do
    visit q7_questions_path

    rows = all('.answer tr')
    within rows[1] do
      col_texts = all('td').map(&:text)
      expect(col_texts).to eq %w(2016-03-13 0 1 0)
    end
    within rows[2] do
      col_texts = all('td').map(&:text)
      expect(col_texts).to eq %w(2016-03-14 0 0 0)
    end
    within rows[3] do
      col_texts = all('td').map(&:text)
      expect(col_texts).to eq %w(2016-03-15 2 0 0)
    end
    within rows[4] do
      col_texts = all('td').map(&:text)
      expect(col_texts).to eq %w(2016-03-16 0 0 0)
    end
    within rows[5] do
      col_texts = all('td').map(&:text)
      expect(col_texts).to eq %w(2016-03-17 0 0 0)
    end
    within rows[6] do
      col_texts = all('td').map(&:text)
      expect(col_texts).to eq %w(2016-03-18 1 0 0)
    end
    within rows[7] do
      col_texts = all('td').map(&:text)
      expect(col_texts).to eq %w(2016-03-19 0 1 0)
    end
    assert_sql_count
  end
end