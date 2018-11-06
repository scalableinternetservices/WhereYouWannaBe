class User < ApplicationRecord

	include ActiveModel::Validations

	# attr_reader :name, :age, :email

	has_many :events, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :attendees, dependent: :destroy

	validates:name, presence:true
	validates:city, presence:true
	validates_numericality_of :age, greater_than: -1
	validates:email, presence:true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: 'Only valid emails allowed'
    }
    validates_uniqueness_of   :email
	has_secure_password
	# validates :password, presence: true, length: { minimum: 6 }
end
