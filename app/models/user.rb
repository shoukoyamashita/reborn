class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :prof, length: { maximum: 500 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
  has_secure_password
  
  has_many :restaurants, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :mylists
  has_many :likes, through: :mylists, source: :restaurant
  
  def like(restaurant)
    self.mylists.find_or_create_by(restaurant_id: restaurant.id)
  end
  
  def unlike(restaurant)
    mylist = self.mylists.find_by(restaurant_id: restaurant.id)
    mylist.destroy if mylist
  end
  
  def liking?(restaurant)
    self.likes.include?(restaurant)
  end
  
# # お気に入り一覧を表示 
#   def feed_likemicroposts
#     Micropost.where(user_id: self.like_ids)
#   end
end
