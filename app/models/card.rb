class Card < ActiveRecord::Base
	belongs_to :group
	belongs_to :topic
  has_many :taggings
  has_many :topics, through: :taggings

	validates_presence_of :title
	validates_presence_of :question
	validates_presence_of :answer
	validates_presence_of :group_id

  def topic_list
    topics.map(&:name).join(", ")
  end

  def topic_list=(names)
    self.topics = names.split(",").map do |n|
      Topic.where(name: n.strip).first_or_create!
    end
  end

  class << self

    def tagged_with(name)
      Topic.find_by_name!(name).topics
    end

    def tag_counts
      Topic.select("topics.*, count(taggings.topic_id) as count").joins(:taggings).group("taggings.topic_id")
    end

  end

end
