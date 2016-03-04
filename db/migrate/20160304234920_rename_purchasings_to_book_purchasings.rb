class RenamePurchasingsToBookPurchasings < ActiveRecord::Migration
  def change
    rename_table :purchasings, :book_purchasings
  end
end
