class User < ApplicationRecord

	include ActiveModel::Validations

	# attr_reader :name, :age, :email

	has_many :events, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :attendees, dependent: :destroy
	has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

	has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

	has_many :following, through: :active_relationships, source: :followed

	has_many :followers, through: :passive_relationships, source: :follower

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


	# Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
	end

	def self.getUser(user_id)
		# puts 'getting from cache' << "/user/#{user_id}"
		Rails.cache.fetch("/user/#{user_id}", expires_in: 20.minutes) do
			# puts'I think Im working'
			u = User.find_by(id: user_id)
			u
		end
	end

	def self.deleteCurrUserCache(user_id)
		Rails.cache.delete "/user/#{user_id}"
	end
end
