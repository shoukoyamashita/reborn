class User < ApplicationRecord
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
end
