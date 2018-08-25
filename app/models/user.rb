class User < ApplicationRecord
  validates :email, length: { in: 5..256 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_save { email.downcase! }
  has_secure_password
  validates :password, length: { in: 6..32 }
  has_many :timelines, dependent: :destroy
  mount_uploader :icon, ImageUploader
end