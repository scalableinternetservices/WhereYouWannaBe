class Tag < ApplicationRecord
  has_many :events

  validates:name,presence:true
  validates_length_of :description, minimum:5, allow_blank: true

  after_commit :flush_tag_cache

  def flush_tag_cache
    # puts 'flushing the cache...'
    Rails.cache.delete 'all_tag'
  end

  def self.all_tags
    Rails.cache.fetch('all_tag', expires_in: 20.minutes) do
      tags = Tag.all
      tags
    end
  end
end
