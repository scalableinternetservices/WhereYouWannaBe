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

  after_commit :flush_loc_cache

  def flush_loc_cache
    # puts 'flushing the cache...'
    Rails.cache.delete 'all_loc'
  end

  def self.all_locations
    Rails.cache.fetch('all_loc', expires_in: 20.minutes) do
      loc = Location.all
      loc
    end
  end

end