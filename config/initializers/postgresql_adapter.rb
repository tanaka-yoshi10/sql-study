require 'active_record/connection_adapters/postgresql_adapter'

ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.class_eval do
  def log_with_arproxy(sql, name = "SQL", binds = [], statement_name = nil)
    QueryCounter.add_query(sql, binds)
    log_without_arproxy(sql, name, binds, statement_name) { yield }
  end
  alias_method :log_without_arproxy, :log
  alias_method :log, :log_with_arproxy
end
