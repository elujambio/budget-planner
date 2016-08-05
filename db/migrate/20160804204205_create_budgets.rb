class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.string :name
      t.decimal :total, precision: 16, scale: 2, default: 0.00
      t.decimal :remaining, precision: 16, scale: 2, default: 0.00

      t.timestamps
    end
  end
end
