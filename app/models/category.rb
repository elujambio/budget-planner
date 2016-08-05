class Category < ApplicationRecord
	has_many :spendings
	belongs_to :budget
end
