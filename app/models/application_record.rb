require 'carrierwave'
require 'mini_magick'
require 'carrierwave/orm/activerecord'
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
