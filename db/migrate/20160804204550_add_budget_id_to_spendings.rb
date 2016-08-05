class AddBudgetIdToSpendings < ActiveRecord::Migration[5.0]
  def change
    add_reference :spendings, :budget, foreign_key: true
  end
end
