require 'csv'

class Card < ActiveRecord::Base
	belongs_to :group
	belongs_to :topic
  has_many :taggings, dependent: :destroy
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

    def add_cards_from_file(group, file_path)
      CSV.foreach(file_path, headers: true) do |row|
        if row.headers == ["title", "question", "answer"]
          title = row["title"]
          question = row["question"]
          answer = row["answer"]
          card = Card.find_or_initialize_by(title: title, question: question, answer: answer, group_id: group.id)
          if card.save
            true
          else
            false
          end
        else
          false
        end
      end
    end

    def tagged_with(name)
      Topic.find_by_name!(name).topics
    end

    def tag_counts
      Topic.select("topics.*, count(taggings.topic_id) as count").joins(:taggings).group("taggings.topic_id")
    end

  end

end
