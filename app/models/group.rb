class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  belongs_to :owner, class_name: "User"
  has_many :users, through: :group_members
  has_many :requests, dependent: :destroy
  
  def is_owned_by?(user)
    owner_id == user.id
  end
  
  def self.search_for(content, method)
    if method == 'perfect'
      Group.where(title: content)
    elsif method == 'forward'
      Group.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Group.where('title LIKE ?', '%'+content)
    else
      Group.where('title LIKE ?', '%'+content+'%')
    end
  end
  
end
