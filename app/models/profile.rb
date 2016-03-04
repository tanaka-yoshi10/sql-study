class Profile < ActiveRecord::Base
  has_many :food_likings
  has_many :liking_foods, through: :food_likings, source: :food

  has_many :food_dislikings
  has_many :disliking_foods, through: :food_dislikings, source: :food

  def self.keyword_search(keyword)
    sql = <<-SQL
SELECT p.*
FROM profiles p
WHERE
(
  EXISTS (
    SELECT *
    FROM food_likings fl
    INNER JOIN foods f
    ON f.id = fl.food_id
    WHERE
    p.id = fl.profile_id
    AND LOWER(f.name) = :food_name
  )
) OR
(
  EXISTS (
    SELECT *
    FROM food_dislikings fd
    INNER JOIN foods f
    ON f.id = fd.food_id
    WHERE
    p.id = fd.profile_id
    AND LOWER(f.name) = :food_name
  )
) OR
p.comment ILIKE :comment
ORDER BY p.id
    SQL
    find_by_sql([sql, food_name: keyword.downcase, comment: "%#{keyword}%"])
  end
end
