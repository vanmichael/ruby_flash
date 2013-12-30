class Membership < ActiveRecord::Base
	belongs_to :user
	belongs_to :group

	validates_presence_of :user_id
	validates_presence_of :group_id

	class << self
		def group_members(group)
			where(group_id: group.id)
		end

		def member?(user, group)
			where(user_id: user.id, group_id: group.id).exists?
		end
	end
end
