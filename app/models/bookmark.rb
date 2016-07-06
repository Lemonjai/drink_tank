class Bookmark < ActiveRecord::Base
	belongs_to :drink
	belongs_to :user
end
