module ApplicationHelper

  def tag_cloud(topics, classes)
    max = topics.sort_by(&:count).last
    topics.each do |topic|
      index = topic.count.to_f / max.count * (classes.size - 1)
      yield(topic, classes[index.round])
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
end
