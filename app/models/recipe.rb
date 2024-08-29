class Recipe < ApplicationRecord
  has_one_attached :image
  
  
  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
  
  validates :title, presence: true
  validates :body, presence: true
  validates :recipe, presence: true
  
end
