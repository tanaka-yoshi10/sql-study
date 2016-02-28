class CreateDepositTransactions < ActiveRecord::Migration
  def change
    create_table :deposit_transactions do |t|
      t.date :occurred_on
      t.integer :amount

      t.timestamps null: false
    end
  end
end
