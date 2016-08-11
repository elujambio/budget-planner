class User < ApplicationRecord
	attr_accessor :password
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true, length: { in: 3..30 }
	validates :password, confirmation: true
	validates_length_of :password, in: 8..20, on: :create
	
	has_many :budgets
	has_many :categories
	# 

	# Assigns API key on create
	before_create do |user|
		user.api_key = user.generate_api_key
	end

	# Generates an unique API key

	def generate_api_key
		loop do
			token = SecureRandom.base64.tr('+/=', 'Qrt')
			break token unless User.exists?(api_key: token)
		end
	end
end

