require "anbt-sql-formatter/formatter"

module ApplicationHelper
  def format_sql(sql)
    rule = AnbtSql::Rule.new
    formatter = AnbtSql::Formatter.new(rule)
    formatter.format(sql)
  end
end