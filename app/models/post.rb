class Post < ApplicationRecord
  attachment :image
  
  belongs_to :tag
  belongs_to :user
  validates :name, :body, presence: true
  
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end
