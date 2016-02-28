class Project < ActiveRecord::Base
  has_many :tasks

  def self.projects_with_coming_tasks
    sql = <<-SQL
WITH projects_with_tasks AS (
SELECT
  row_number() OVER (PARTITION BY p.id ORDER BY t.due_date) AS row_no,
  p.*,
  t.content AS task_content,
  t.due_date AS task_due_date
FROM projects p
INNER JOIN tasks t
ON t.project_id = p.id
WHERE
  t.due_date >= :date
UNION ALL
SELECT
  1 AS row_no,
  p.*,
  NULL AS task_content,
  NULL AS task_due_date
FROM projects p
WHERE
  NOT EXISTS (SELECT * FROM tasks t WHERE t.project_id = p.id)
)
SELECT
  p.*
FROM projects_with_tasks p
WHERE
  p.row_no = 1
ORDER BY
  p.task_due_date
    SQL
    find_by_sql([sql, date: Date.current])
  end
end
