class Tag < ApplicationRecord
  has_many :events
  
  validates:name,presence:true
  validates_length_of :description, maximum: 100, allow_blank: true
end
