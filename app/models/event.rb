require 'carrierwave'
require 'mini_magick'
require 'carrierwave/orm/activerecord'
class Event < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :attendees, dependent: :destroy
  belongs_to :tag
  has_many :comments, dependent: :destroy

  validates :title, presence:true
  validates_length_of :description, maximum: 500, allow_blank: true
  # validates :date, inclusion: { in: (Date.today..Date.today+5.years) }
  validates_numericality_of :price, greater_than: -1

  mount_uploader :avatar, AvatarUploader
end
