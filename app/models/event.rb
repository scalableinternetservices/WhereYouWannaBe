class Event < ApplicationRecord
	belongs_to :user
  belongs_to :location
  has_many :attendees
  belongs_to :tag
  has_many :comments
end
