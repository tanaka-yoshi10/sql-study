require 'active_record/connection_adapters/postgresql_adapter'

ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.class_eval do
  def log_with_query_counter(sql, name = "SQL", binds = [], statement_name = nil)
    QueryCounter.add_query(sql.dup, binds.dup)
    log_without_query_counter(sql, name, binds, statement_name) { yield }
  end
  alias_method :log_without_query_counter, :log
  alias_method :log, :log_with_query_counter
end
