class Book < ActiveRecord::Base
  has_many :purchasings

  scope :purchasing_count_by_age_group, -> {
    joins('LEFT OUTER JOIN purchasings p ON books.id = p.book_id')
      .group(:id)
      .order(:id)
      .select(<<-SQL)
MAX(books.title) AS title,
SUM(CASE WHEN p.age < 20 THEN 1 ELSE 0 END) AS under_19,
SUM(CASE WHEN p.age >= 20 AND p.age < 30 THEN 1 ELSE 0 END) AS age_20s,
SUM(CASE WHEN p.age >= 30 AND p.age < 40 THEN 1 ELSE 0 END) AS age_30s,
SUM(CASE WHEN p.age >= 40 THEN 1 ELSE 0 END) AS over_40
    SQL
  }
end
