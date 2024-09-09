class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
  
  def self.search_for(content, method)
    if method == 'perfect'
      Recipe.where(title: content)
    elsif method == 'forward'
      Recipe.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Recipe.where('title LIKE ?', '%'+content)
    else
      Recipe.where('title LIKE ?', '%'+content+'%')
    end
  end

  
  validates :title, presence: true
  validates :body, presence: true
  validates :recipe, presence: true
  
end
