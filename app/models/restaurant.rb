class Restaurant < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :place, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
#  validates :photo, length: { maximum: 255 }
  mount_uploader :photo, PhotoUploader

end