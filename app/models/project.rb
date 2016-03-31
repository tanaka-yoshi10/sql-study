class Project < ActiveRecord::Base
  has_many :tasks
  def self.projects_with_coming_tasks
    sql = <<-SQL
WITH project_dues AS(
  WITH valid_tasks AS(
    SELECT *
    FROM tasks
    WHERE due_date > now()
  )
  SELECT *
  FROM valid_tasks as t
  WHERE NOT EXISTS(
    SELECT 1
    FROM valid_tasks AS vt
    WHERE vt.project_id = t.project_id
      AND vt.due_date < t.due_date
  )
)
SELECT projects.id, projects.name , d.content as task_name, d.due_date as task_due_date
FROM projects
  LEFT OUTER JOIN project_dues d
  ON projects.id = d.project_id
WHERE NOT projects.id IN (
  SELECT t.project_id
  FROM tasks AS t
  WHERE NOT EXISTS(
      SELECT 1
      FROM tasks
      WHERE tasks.project_id = t.project_id
            AND tasks.due_date > t.due_date
  )
        AND t.due_date < now()
)
ORDER BY d.due_date
    SQL
    find_by_sql(sql)
  end
end
