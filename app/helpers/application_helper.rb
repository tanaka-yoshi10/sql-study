require "anbt-sql-formatter/formatter"

module ApplicationHelper
  def format_sql(sql)
    rule = AnbtSql::Rule.new
    formatter = AnbtSql::Formatter.new(rule)
    formatted_sql = formatter.format(sql).gsub('" . ', '".').gsub('. *', '.*').gsub(' : : ', '::')
    Simplabs::Highlight.highlight :sql, "    #{formatted_sql}".strip_heredoc
  end
end