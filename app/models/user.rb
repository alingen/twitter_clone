class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, length: { maximum: 50 }

  has_one_attached :image

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def tweet_and_reply
    timeline = Tweet.joins("LEFT OUTER JOIN comments ON tweets.id = comments.tweet_id AND comments.user_id = #{self.id}").select('tweets.*', 'comments.id AS comments_id', 'comments.text AS comments_text', 'comments.created_at AS comments_time', 'comments.user_id AS comments_user_id')
    timeline = timeline.where(user_id: self.id).or(timeline.where("comments.user_id = ?", self.id)).order(created_at: :desc).preload(:user, :comments, :likes)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :likes, as: :likeable
  has_many :comments
end
