class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_one_attached :profile_picture
  
  validates :name, presence: true
  
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
end
