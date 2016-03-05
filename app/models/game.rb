class Game < ActiveRecord::Base
  has_many :game_purchasings

  def self.purchasing_count_by_date_and_title(date_range)
    sql = <<-SQL
WITH calendar AS (
    SELECT CURRENT_DATE + i AS target_date
    FROM generate_series(DATE '2016-03-13' - CURRENT_DATE,
                         DATE '2016-03-19' - CURRENT_DATE) i
),
  purchasing_summaries AS (
      SELECT
        MAX(g.title) AS game_title,
        (gp.purchased_at + interval '9h')::date AS purchased_on,
        count(*) AS cnt
      FROM games g
        LEFT OUTER JOIN game_purchasings gp
          ON gp.game_id = g.id
    GROUP BY g.id, (gp.purchased_at  + interval '9h')::date
  )
SELECT
  c.target_date,
  CAST(SUM(CASE WHEN ps.game_title = 'Mario' THEN ps.cnt ELSE 0 END) AS INTEGER) AS mario_cnt,
  CAST(SUM(CASE WHEN ps.game_title = 'Tetris' THEN ps.cnt ELSE 0 END) AS INTEGER) AS tetris_cnt,
  CAST(SUM(CASE WHEN ps.game_title = 'FF4' THEN ps.cnt ELSE 0 END) AS INTEGER) AS ff4_cnt
FROM
  calendar c
LEFT OUTER JOIN purchasing_summaries ps
  ON ps.purchased_on = c.target_date
  GROUP BY c.target_date
ORDER BY
  c.target_date
    SQL

    find_by_sql(sql)
  end
end
