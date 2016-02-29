module SqlHelpers
  def assert_sql_count
    count_text = find('.query-count').text
    count = count_text[/\d+/].to_i
    expect(count).to be > 0
    if count > 1
      STDERR.puts "[WARN] Query count: #{count} (#{caller.first})"
    end
  end
end