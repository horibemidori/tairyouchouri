class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
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

  enum category1: { school: 1, nursery_school: 2, nursing_home: 3, hospital: 4, employee_cafeteria:5, others: 6 }, _prefix: true
  #1:学校 ,2:保育園 ,3:高齢者施設 ,4:病院,5:社員食堂,6:その他
  enum category2: { new_year: 1, setsubun: 2, hinamatsuri: 3, kodomonohi: 4, otsukimi:5, halloween: 6, christmas: 7, others: 8 }, _prefix: true
  # 1:お正月 ,2:節分 ,3:ひなまつり ,4:こどもの日,5:お月見,6:ハロウィン,7: クリスマス,8:その他
end
