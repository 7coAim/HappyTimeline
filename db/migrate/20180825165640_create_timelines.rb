class CreateTimelines < ActiveRecord::Migration[5.1]
  def change
    create_table :timelines do |t|
      t.string :title
      t.string :to_name
      t.string :from_name
      t.integer :design_id
      t.text :memo
      t.boolean :locked
      t.string :url
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
