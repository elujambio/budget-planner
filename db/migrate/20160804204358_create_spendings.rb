class CreateSpendings < ActiveRecord::Migration[5.0]
  def change
    create_table :spendings do |t|
      t.decimal :amount, precision: 16, scale: 2, default: 0.00
      t.string :detail

      t.timestamps
    end
  end
end
