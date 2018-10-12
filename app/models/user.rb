class User < ApplicationRecord

	include ActiveModel::Validations

	attr_reader :name, :age, :email

	validates :name, presence: true
	validates :age, numericality: true 
  validates :email, presence: true, format: { with: /A[^@s] @[^@s] z/, allow_blank: true }

	has_many :events
	has_many :comments
	has_many :attendees
end
