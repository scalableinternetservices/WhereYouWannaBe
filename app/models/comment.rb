class Comment < ApplicationRecord
	belongs_to :user,touch: true
	belongs_to :event,touch: true
end
