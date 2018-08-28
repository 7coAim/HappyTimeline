class ChangeColumnToTimeline < ActiveRecord::Migration[5.1]
  def change
    change_column :timelines, :url, :string, null: false
    add_index :timelines, :url, unique: true
  end
end
