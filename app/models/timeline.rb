class Timeline < ApplicationRecord
  validates :title, length: { in: 1..32 }
  validates :to_name, length: { in: 1..32 }
  validates :from_name, length: { in: 1..32 }
  validates :memo, length: { in: 0..1000 }
  belongs_to :user
  has_many :messages, dependent: :destroy

  before_create :set_create_url

  def to_param
    url
  end

  private

  def set_create_url
    loop do
      self.url = SecureRandom.hex(10)
      break unless Timeline.where(url: url).exists?
    end
  end
end
