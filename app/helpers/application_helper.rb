require "anbt-sql-formatter/formatter"

module ApplicationHelper
  def format_sql(sql)
    rule = AnbtSql::Rule.new
    formatter = AnbtSql::Formatter.new(rule)
    Simplabs::Highlight.highlight :sql, "    #{formatter.format(sql)}".strip_heredoc
  end
end