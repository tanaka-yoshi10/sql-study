class Book < ActiveRecord::Base
  has_many :purchasings

  def self.purchasing_count_by_age_group
    sql = <<-SQL
SELECT
  b.id,
  MAX(b.title) AS title,
  SUM(CASE WHEN p.age < 20 THEN 1 ELSE 0 END) AS under_19,
  SUM(CASE WHEN p.age >= 20 AND p.age < 30 THEN 1 ELSE 0 END) AS age_20s,
  SUM(CASE WHEN p.age >= 30 AND p.age < 40 THEN 1 ELSE 0 END) AS age_30s,
  SUM(CASE WHEN p.age >= 40 THEN 1 ELSE 0 END) AS over_40
FROM books b
LEFT OUTER JOIN purchasings p
ON b.id = p.book_id
GROUP BY b.id
ORDER BY b.id
    SQL
    find_by_sql(sql)
  end
end
