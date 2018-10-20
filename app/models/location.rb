class Location < ApplicationRecord
  has_many :event
 
  validates:name, presence:true
  validates:city, presence:true
  validates:email, presence:true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: 'Only valid emails allowed'
  }
  validates :phone, format: { with: /\d{10}/, message: "Bad format for phone number" }
  validates_numericality_of :capacity, greater_than: 0
end