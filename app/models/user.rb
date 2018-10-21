class User < ApplicationRecord

	include ActiveModel::Validations

	# attr_reader :name, :age, :email

	has_many :events
	has_many :comments
	has_many :attendees
	
	validates:name, presence:true
	validates :age, numericality: true 
	validates:email, presence:true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: 'Only valid emails allowed'
    }
	validates:password, presence:true
end
