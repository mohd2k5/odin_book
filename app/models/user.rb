class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  has_many :comments, dependent: :destroy
  
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  
  has_many :sent_follows,
       class_name: "Follow",
       foreign_key: :follower_id,
       dependent: :destroy

  has_many :received_follows,
           class_name: "Follow",
           foreign_key: :followed_id,
           dependent: :destroy

  has_many :following,
           -> { where(follows: { status: 1 }) },
           through: :sent_follows,
           source: :followed

  has_many :followers,
           -> { where(follows: { status: 1 }) },
           through: :received_follows,
           source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 30 }
  
  after_create :send_welcome_email

  private

  def send_welcome_email
    OdinMailer.new_welcome_email(self).deliver_now
  end
end
