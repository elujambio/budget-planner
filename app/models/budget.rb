class Budget < ApplicationRecord
	has_many :categories
	has_many :spendings
end
