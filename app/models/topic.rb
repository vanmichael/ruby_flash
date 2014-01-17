class Topic < ActiveRecord::Base
	has_many :cards
  has_many :taggings
  has_many :cards, through: :taggings

	validates_presence_of :name
	validates_uniqueness_of :name

  class << self

    def search(search)
      if search
        where('name LIKE ?', "%#{search}%")
      else
        scoped
      end
    end
  end
end
