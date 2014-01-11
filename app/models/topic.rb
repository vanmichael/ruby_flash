class Topic < ActiveRecord::Base
	has_many :cards
	validates_presence_of :name
	validates_uniqueness_of :name
end
