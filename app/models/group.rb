class Group < ActiveRecord::Base
	has_many :cards
	has_many :memberships
	has_many :users, through: :memberships
	validates_presence_of :name

	def add
		if save
			NewGroupConfirmation.notification.deliver
			return true
		else
			return false
		end
	end
end
