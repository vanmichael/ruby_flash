class RemoveTopicFromCard < ActiveRecord::Migration
  def change
    remove_column :cards, :topic_id
  end
end
