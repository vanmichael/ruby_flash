class Card < ActiveRecord::Base
	belongs_to :group
	belongs_to :topic

	validates_presence_of :title
	validates_presence_of :question
	validates_presence_of :answer
	validates_presence_of :group_id
	validates_presence_of :topic_id
	
end
