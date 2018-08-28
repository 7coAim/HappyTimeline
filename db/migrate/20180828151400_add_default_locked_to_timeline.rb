class AddDefaultLockedToTimeline < ActiveRecord::Migration[5.1]
  def change
    change_column :timelines, :locked, :boolean, default: false
  end
end
