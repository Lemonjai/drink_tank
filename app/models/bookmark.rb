class Bookmark < ActiveRecord::Base
	belongs_to :drink
	belongs_to :user

	def bookmarked_already?
		if Bookmark.where(user_id: self.user_id).where(drink_id: self.event_id).present?
			errors.add(:user_id, "has already bookmarked this event")
		end
	end
end
