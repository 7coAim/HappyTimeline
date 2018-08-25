class Message < ApplicationRecord
  validates :post_text, length: { in: 1..140 }
  validates :post_password, length: { in: 0..32 }
  validates :post_name, length: { in: 1..32 }
  belongs_to :timeline
  mount_uploader :post_image, ImageUploader
end
