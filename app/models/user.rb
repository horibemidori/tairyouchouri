class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       
  has_many :favorites, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members
  has_many :requests, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end
  end
  
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
      user.nickname = "guestuser"
    end
  end
  def guest_user?
    email == GUEST_USER_EMAIL
  end
  
  validates :name, presence: true
  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create
end
