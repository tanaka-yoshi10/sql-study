require 'rails_helper'

feature 'Question 4' do
  scenario do
    visit q4_questions_path

    rows = all('.answer tr')
    within rows[1] do
      col_texts = all('td').map(&:text)
      expect(col_texts).to eq %w(2016-03-01 2000 3000 2000)
    end
    within rows[2] do
      col_texts = all('td').map(&:text)
      expect(col_texts).to eq %w(2016-03-02 8000 0 10000)
    end
    within rows[3] do
      col_texts = all('td').map(&:text)
      expect(col_texts).to eq %w(2016-03-05 0 3000 7000)
    end
    within rows[4] do
      col_texts = all('td').map(&:text)
      expect(col_texts).to eq %w(2016-03-06 7000 4000 10000)
    end
  end
end