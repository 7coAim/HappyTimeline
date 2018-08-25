class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :post_text
      t.text :post_image
      t.string :post_password
      t.string :post_name
      t.references :timeline, foreign_key: true
      t.timestamps
    end
  end
end
