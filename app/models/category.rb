class Category < ApplicationRecord
	has_many :spendings
	belongs_to :budget
	belongs_to :user
end
