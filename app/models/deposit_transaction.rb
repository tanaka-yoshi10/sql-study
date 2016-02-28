class DepositTransaction < ActiveRecord::Base
  def self.daily_transactions(year: 2016, month: 3)
    sql = <<-SQL
WITH transaction_summary AS (
    SELECT
      occurred_on,
      sum(CASE WHEN amount > 0 THEN amount ELSE 0 END) AS deposit,
      sum(CASE WHEN amount < 0 THEN -amount ELSE 0 END) AS payment
    FROM deposit_transactions
    GROUP BY occurred_on
)
  , transaction_summary_with_cum AS (
    SELECT
      occurred_on,
      deposit,
      payment,
      sum(deposit - payment) OVER (ORDER BY occurred_on) AS cum_remainder
    FROM transaction_summary
)
SELECT
  occurred_on,
  deposit,
  payment,
  CAST(cum_remainder AS INTEGER) AS cum_remainder
FROM transaction_summary_with_cum
WHERE
  occurred_on BETWEEN :from AND :to
ORDER BY occurred_on
    SQL
    from = "#{year}-#{month}-01".to_date
    to = from.end_of_month
    find_by_sql([sql, from: from, to: to])
  end
end
