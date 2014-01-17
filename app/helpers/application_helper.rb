module ApplicationHelper
  def tag_cloud(topics, classes)
    max = topics.sort_by(&:count).last
    topics.each do |topic|
      index = topic.count.to_f / max.count * (classes.size - 1)
      yield(topic, classes[index.round])
    end
  end
end
