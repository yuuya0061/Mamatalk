class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_one_attached :profile_image
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed


  validates :name, presence: true
  validates :email_address, presence: true, uniqueness: true
  validates :password, presence: true,length: { minimum: 6 }, on: :create

  def get_profile_image(width, height)
    if profile_image.attached?
      profile_image.variant(resize_to_limit: [width, height]).processed
    else
      "no_image.jpg"
    end
  end

  def self.guest
    find_or_create_by!(email_address: "guest@example.com") do |user|
      user.name = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
    end
  end

   def self.search_for(content, method)
      if method == "perfect"
        where(name: content)
      elsif method == "forward"
        where("name LIKE ?", "#{content}%")
      elsif method == "backward"
        where("name LIKE ?", "%#{content}")
      else
        where("name LIKE ?", "%#{content}%")
      end
    end

    def follow(user)
      relationships.create(followed_id: user.id)
    end

    def unfollow(user)
      relationships.find_by(followed_id: user.id).destroy
    end

    def following?(user)
      followings.include?(user)
    end

end
