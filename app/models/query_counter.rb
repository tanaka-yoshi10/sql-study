module QueryCounter
  class << self
    def init
      Rails.logger.debug "[DEBUG] Init QueryCounter"
      Thread.current[:query_counter] = []
    end

    def add_query(query, binds)
      init if Thread.current[:query_counter].nil?
      Rails.logger.debug "[DEBUG] Add query: #{query.squish}"
      Thread.current[:query_counter] << [query, binds]
    end

    def queries
      Thread.current[:query_counter]
    end

    def crud_queries
      queries.select { |query, _| query =~ /select|insert|update|delete/i }
    end
  end
end
