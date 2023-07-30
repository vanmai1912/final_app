class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photos
  has_many :albums
  mount_uploader :image, ImageUploader

  has_many :follows_as_follower, class_name: "Follow", foreign_key: "follower_id"
  has_many :follows_as_following, class_name: "Follow", foreign_key: "following_id"

  has_many :followers, through: :follows_as_following, source: :follower
  has_many :followings, through: :follows_as_follower, source: :following

  # user a follow user b -> Follow.create(follower: a, following: b)
  # xem user a đã follow ai -> a.followings
  # xem user a được ai follow -> a.followers

end
