class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  scope :feed_for, ->(user) {
    where(user_id: [user.id] + user.following.select(:id))
      .includes(:user)
      .order(created_at: :desc)
  }

  validates :caption, presence: true
end
