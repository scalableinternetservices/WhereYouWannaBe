class Tag < ApplicationRecord
  has_many :events

  validates:name,presence:true
  validates_length_of :description, minimum:5, allow_blank: true
end
