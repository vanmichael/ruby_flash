class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.text :question, null: false
      t.text :answer, null: false
      t.integer :group_id, null: false
      t.integer :topic_id, null: false
      t.integer :updated_by

      t.timestamps
    end
  end
end
