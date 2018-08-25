class Timeline < ApplicationRecord
  validates :title, length: { in: 1..32 }
  validates :to_name, length: { in: 0..32 }
  validates :from_name, length: { in: 0..32 }
  belongs_to :user
  has_many :messages, dependent: :destroy
end
