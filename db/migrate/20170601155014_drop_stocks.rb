class DropStocks < ActiveRecord::Migration[5.1]
  def change
    drop_table :stocks 
  end
end
