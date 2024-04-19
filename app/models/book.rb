class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favorite, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  
  def favorite_by?(user)
    favorite.exists?(user_id: user.id)
  end
  
end
