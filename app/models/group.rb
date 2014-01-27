class Group < ActiveRecord::Base
	has_many :cards, dependent: :destroy
	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships

  validates_presence_of :name

	def add
		if self.save
			#NewGroupConfirmation.notification(self).deliver
			return true
		else
			return false
		end
	end

	def membership_from(user)
		memberships.find_by(user_id: user.id)
	end

	class << self

    def search(search)
      if search
        where('name iLIKE ?', "%#{search}%")
      else
        scoped
      end
    end
  end

end
