class Budget < ApplicationRecord
	has_many :categories
	has_many :spendings
	belongs_to :user

	before_create :set_remaining_budget 

	private
		def set_remaining_budget
			self.remaining = self.total
		end

end
