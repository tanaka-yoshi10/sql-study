class Book < ActiveRecord::Base
  has_many :book_purchasings

  scope :purchasing_count_by_age_group, -> {
    joins("LEFT OUTER JOIN book_purchasings bp on books.id = bp.book_id")
      .group(:id)
      .order(:id)
      .select(<<-SQL)
MAX(books.title) as title,
COUNT( CASE WHEN bp.age <= 19 THEN TRUE ELSE NULL END ) AS under_19,
COUNT( CASE WHEN bp.age >= 20 and bp.age < 30 THEN TRUE ELSE NULL END ) AS age_20s,
COUNT( CASE WHEN bp.age >= 30 and bp.age < 40 THEN TRUE ELSE NULL END ) AS age_30s,
COUNT( CASE WHEN bp.age >= 40 THEN TRUE ELSE NULL END ) AS over_40
    SQL
  }
end
