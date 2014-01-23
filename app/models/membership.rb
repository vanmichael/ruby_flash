class Membership < ActiveRecord::Base
	belongs_to :user, inverse_of: :memberships
	belongs_to :group, inverse_of: :memberships

	validates_presence_of :user
	validates_presence_of :group

end
