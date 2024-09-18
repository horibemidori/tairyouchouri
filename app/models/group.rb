class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  belongs_to :owner, class_name: "User"
  has_many :users, through: :group_members
  
  def is_owned_by?(user)
    owner_id == user.id
  end
end
