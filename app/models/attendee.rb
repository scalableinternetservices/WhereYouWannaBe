class Attendee < ApplicationRecord
  belongs_to :event
  belongs_to :user
  
  validates :guests_count, presence:true
  validates_numericality_of :guests_count, greater_than: -1
end